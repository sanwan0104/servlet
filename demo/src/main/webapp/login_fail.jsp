<%--
  Created by IntelliJ IDEA.
  User: sanwan
  Date: 2024/5/8
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录失败</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: linear-gradient(to right, #fbc2eb, #a6c1ee);
        }

        .login-wrapper {
            background-color: #fff;
            width: 358px;
            height: auto;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .msg {
            text-align: center;
            margin-top: 20px;
            color: #f44336;
            font-size: 16px;
        }

        a {
            display: block;
            text-align: center;
            text-decoration: none;
            color: #abc1ee;
            margin-top: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="login-wrapper">
    <div class="header">登录失败</div>
    <p class="msg">用户名或密码错误，请重新登录。</p>
    <a href="login.jsp">返回登录页面</a>
</div>
</body>
</html>


