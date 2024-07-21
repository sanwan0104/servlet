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
import java.sql.ResultSet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String users = request.getParameter("username");
        String pass = request.getParameter("pwd");
        boolean flag = false;
        Connection conn = null;
        PreparedStatement sql = null;
        ResultSet rs = null;

        try {
            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://127.0.0.1:3306/mydb";
            String use = "root";
            String password = "123456";

            Class.forName(driver);
            conn = DriverManager.getConnection(url, use, password);

            sql = conn.prepareStatement("select * from student where username=? and password=?");
            sql.setString(1, users);
            sql.setString(2, pass);
            rs = sql.executeQuery();

            if (rs.next()) {
                flag = true;
            }

            rs.close();
            sql.close();
            conn.close();

            if (flag) {
                response.sendRedirect("index1.jsp");
            } else {
                response.sendRedirect("login_fail.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("登录过程出现异常，请联系管理员。");
        } finally {
            out.close();
        }
    }
}
