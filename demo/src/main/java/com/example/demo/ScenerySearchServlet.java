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

@WebServlet("/scenerySearch")
public class ScenerySearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<ScenicSpot> results = searchScenicSpots(keyword, request);
        request.setAttribute("results", results);
        request.getRequestDispatcher("scenery.jsp").forward(request, response);
    }

    private List<ScenicSpot> searchScenicSpots(String keyword, HttpServletRequest request) {
        List<ScenicSpot> results = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/mydb";
        String username = "root";
        String password = "123456";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql = "SELECT name, description, image_url FROM scenic_spots WHERE name LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                String imageUrl = request.getContextPath() + "/images/" + rs.getString("image_url"); // Constructing the image URL
                ScenicSpot spot = new ScenicSpot(name, description, imageUrl);
                results.add(spot);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return results;
    }
}
