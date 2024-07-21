<%--
  Created by IntelliJ IDEA.
  User: sanwan
  Date: 2024/5/12
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">


<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>个人网站</title>

  <link rel="stylesheet" href="style.css">

</head>

<body>
<header>
  <a href="https://www.cjlu.edu.cn/"><img src="school_logo.png" alt="学校Logo" >
  </a>
</header>

<nav>
  <ul>
    <li><a href="index1.jsp" >基本信息</a></li>
    <li><a href="index2.jsp" >擅长类型</a></li>
    <li><a href="food.jsp" >家乡特产和美食</a></li>
    <li><a href="scenery.jsp">家乡旅游景点</a></li>
  </ul>
</nav>
<!-- 导航栏 -->


<div class="layuimini-container">
  <div class="layuimini-main" >
    <p style="clear:both"></p>
    <div style="width:60%;background:#FFF;margin:auto;padding:1% 0" id="DownLoadPDF">


      <tr>
        <td colspan="6" style="text-align:left;">
          <div style="padding: 0 1%;">
            <h1>擅长类型</h1>
            <hr class="layui-border-black" style="margin:0 !important;">
          </div>
        </td>
      </tr>



      <tr align="button">
        <video controls >
          <source src="dijia.mp4	">
        </video>
      </tr>
    </div>

  </div>
</div>


<footer>
  <p>学号：2200303318 | 姓名：方阳奕 | 班级：22计算机3班 | 联系方式：17758042058</p>
  <p>&copy; 2023. All rights reserved.</p>
</footer>


<script src="script.js"></script>
</body>


</html>
