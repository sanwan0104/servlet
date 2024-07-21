package com.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/foodSearch")
public class FoodSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<FoodItem> results = searchFoodItems(keyword, request);
        request.setAttribute("results", results);
        request.getRequestDispatcher("food.jsp").forward(request, response);
    }

    private List<FoodItem> searchFoodItems(String keyword, HttpServletRequest request) {
        List<FoodItem> results = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/mydb";
        String username = "root";
        String password = "123456";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql = "SELECT name, description, image_url FROM food_items WHERE name LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                String imageUrl = "/images/" + rs.getString("image_url");
                FoodItem item = new FoodItem(name, description, imageUrl);
                results.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return results;
    }
}
