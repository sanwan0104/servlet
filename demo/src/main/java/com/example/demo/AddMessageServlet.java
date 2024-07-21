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

@WebServlet("/AddMessageServlet")
public class AddMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mydb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "123456";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String peopleName = request.getParameter("peopleName");
        String title = request.getParameter("title");
        String contents = request.getParameter("contents");

        try {
            // 注册JDBC驱动
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                String sql = "INSERT INTO guestbook_messages (peopleName, title, contents) VALUES (?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, peopleName);
                    stmt.setString(2, title);
                    stmt.setString(3, contents);
                    stmt.executeUpdate();
                    // 重定向到显示留言的Servlet
                    response.sendRedirect("ShowMessagesServlet");
                }
            }
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC驱动未找到", e);
        } catch (SQLException e) {
            throw new ServletException("数据库操作失败", e);
        }
    }
}
