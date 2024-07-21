<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
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
            height: 400px;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            font-size: 38px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }

        .input-item {
            width: 100%;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .msg {
            text-align: center;
            margin-top: 20px;
        }

        a {
            text-decoration: none;
            color: #abc1ee;
        }
        .music-controls {
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
        }

        .music-controls button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        #play-btn {
            background-color: #4CAF50;
            color: white;
        }

        #pause-btn {
            background-color: #f44336;
            color: white;
        }

    </style>
</head>

<body>
    <div class="login-wrapper">
        <div class="header">用户登录</div>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="用户名" class="input-item" required>
            <input type="password" name="pwd" placeholder="密码" class="input-item" required>
            <button type="submit" class="btn">登录</button>
        </form>
        <div class="msg">
            还没有账号？ <a href="register.jsp">注册</a>
        </div>
        <div class="music-controls">
          <button id="play-btn">播放音乐</button>
          <button id="pause-btn">暂停音乐</button>
          </div>

    </div>
    <!-- Audio Player -->
    <audio id="bg-music" src="music.mp3" loop></audio>

    <!-- Scripts -->
    <script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            var audio = document.getElementById("bg-music");

            $("#play-btn").click(function () {
                audio.play();
            });

            $("#pause-btn").click(function () {
                audio.pause();
            });
        });
    </script>
</body>

</html>
