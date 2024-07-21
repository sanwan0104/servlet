package com.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/foodDelete")
public class FoodDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String DB_URL = "jdbc:mysql://localhost:3306/mydb";
    private final String DB_USERNAME = "root";
    private final String DB_PASSWORD = "123456";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String foodName = request.getParameter("name"); // 获取要删除的食品名称

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
            String sql = "DELETE FROM food_items WHERE name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, foodName);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("删除成功");
            } else {
                System.out.println("删除失败，没有找到匹配的记录");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 可以根据需要处理异常
        }

        // 删除完成后重定向到 food.jsp 页面
        response.sendRedirect(request.getContextPath() + "/food.jsp");
    }
}
