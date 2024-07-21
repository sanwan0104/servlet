package com.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ShowMessagesServlet")
public class ShowMessagesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mydb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "123456";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             Statement stmt = conn.createStatement()) {
            String sql = "SELECT * FROM guestbook_messages";
            try (ResultSet rs = stmt.executeQuery(sql)) {
                response.getWriter().println("<html><body>");
                response.getWriter().println("<h2>留言列表</h2>");
                while (rs.next()) {
                    response.getWriter().println("<p><strong>留言者:</strong> " + rs.getString("peopleName") + "<br>");
                    response.getWriter().println("<strong>标题:</strong> " + rs.getString("title") + "<br>");
                    response.getWriter().println("<strong>留言:</strong> " + rs.getString("contents") + "</p><hr>");
                }
                response.getWriter().println("</body></html>");
            }
        } catch (SQLException e) {
            throw new ServletException("数据库操作失败", e);
        }
    }
}
