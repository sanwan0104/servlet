package com.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet("/foodUpload")
@MultipartConfig
public class FoodUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String UPLOAD_DIRECTORY = "D:/apache-tomcat-10.1.19/webapps/servlet/demo/src/main/webapp/images";
    private final String DB_URL = "jdbc:mysql://localhost:3306/mydb";
    private final String DB_USERNAME = "root";
    private final String DB_PASSWORD = "123456";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String foodName = request.getParameter("foodName");
        String foodDescription = request.getParameter("foodDescription");
        Part filePart = request.getPart("foodImage");

        // 保存文件并获取文件路径
        String imageUrl = saveImageFile(filePart);

        // 将食品信息保存到数据库
        saveFoodItem(foodName, foodDescription, imageUrl);

        // 执行搜索获取最新的食品列表并转发到food.jsp页面显示
        List<FoodItem> foodItems = fetchFoodItems(request);
        request.setAttribute("results", foodItems);
        request.getRequestDispatcher("food.jsp").forward(request, response);
    }

    private String saveImageFile(Part filePart) throws IOException {
        String fileName = UUID.randomUUID().toString() + ".jpg";
        String filePath = UPLOAD_DIRECTORY + File.separator + fileName;

        try (InputStream inputStream = filePart.getInputStream();
             OutputStream outputStream = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }

        return fileName;
    }

    private void saveFoodItem(String foodName, String foodDescription, String imageUrl) {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            conn.setAutoCommit(false);  // 开启事务

            String sql = "INSERT INTO food_items (name, description, image_url) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, foodName);
                stmt.setString(2, foodDescription);
                stmt.setString(3, imageUrl);
                stmt.executeUpdate();

                conn.commit();  // 提交事务
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 回滚事务
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
        } finally {
            // 关闭连接
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException closeEx) {
                    closeEx.printStackTrace();
                }
            }
        }
    }

    private List<FoodItem> fetchFoodItems(HttpServletRequest request) {
        List<FoodItem> foodItems = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
            String sql = "SELECT name, description, image_url FROM food_items";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String imageUrl = request.getContextPath() + "/images/" + rs.getString("image_url");
                    FoodItem foodItem = new FoodItem(name, description, imageUrl);
                    foodItems.add(foodItem);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return foodItems;
    }
}
