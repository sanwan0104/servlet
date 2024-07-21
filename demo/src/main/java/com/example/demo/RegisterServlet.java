package com.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("pwd");
        String confirmPassword = request.getParameter("pwd2");

        // 检查密码是否匹配
        if (!password.equals(confirmPassword)) {
            out.println("两次输入的密码不一致，请重新输入。");
            return;
        }

        // 数据库连接信息
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/mydb";
        String dbUsername = "root";
        String dbPassword = "123456";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // 插入用户数据到数据库
            String sql = "INSERT INTO student(username, password) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            int rowCount = pstmt.executeUpdate();
            if (rowCount > 0) {
                // 注册成功，重定向到成功页面
                response.sendRedirect("success.jsp");
            } else {
                // 注册失败
                out.println("注册失败，请稍后重试。");
            }

        } catch (ClassNotFoundException | SQLException e) {
            out.println("注册过程出现异常: " + e.getMessage());
        } finally {
            // 关闭资源
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                out.println("关闭数据库连接出现异常: " + e.getMessage());
            }
            out.close();
        }
    }
}
