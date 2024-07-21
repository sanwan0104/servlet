<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>家乡特产和美食</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
  <a href="https://www.cjlu.edu.cn/">
    <img src="school_logo.png" alt="学校Logo">
  </a>
</header>
<nav>
  <ul>
    <li><a href="index1.jsp">基本信息</a></li>
    <li><a href="index2.jsp">擅长类型</a></li>
    <li><a href="food.jsp">家乡特产和美食</a></li>
    <li><a href="scenery.jsp">家乡旅游景点</a></li>
  </ul>
</nav>
<div id="content">
  <section id="hometown">
    <h2>家乡特产和美食</h2>
    <div id="search-container">
      <h1>美食搜索结果</h1>
      <form method="post" action="foodSearch">
        <label for="keyword">输入关键词：</label>
        <input type="text" id="keyword" name="keyword" placeholder="请输入关键词">
        <button type="submit">搜索</button>
      </form>
      <hr>
      <h2>搜索结果：</h2>
      <ul>
        <c:forEach var="item" items="${results}">
          <li>
            <h3>${item.name}</h3>
            <p>${item.description}</p>
            <img src="${item.imageUrl}" alt="${item.name}" style="max-width: 400px;">
            <form method="post" action="foodDelete">
              <input type="hidden" name="name" value="${item.name}">
              <button type="submit">删除</button>
            </form>
          </li>
        </c:forEach>
      </ul>
      <c:if test="${empty results}">
        <p>未找到相关美食</p>
      </c:if>

      <h2>上传新美食</h2>
      <form method="post" action="foodUpload" enctype="multipart/form-data" id="uploadForm">
        <label for="foodName">食品名称:</label>
        <input type="text" id="foodName" name="foodName" required><br>
        <label for="foodDescription">描述:</label>
        <textarea id="foodDescription" name="foodDescription" required></textarea><br>
        <label for="foodImage">图片:</label>
        <input type="file" id="foodImage" name="foodImage" accept="image/jpeg, image/png" required><br>
        <button type="submit">上传</button>
      </form>
      <h3>图片预览</h3>
      <img id="imagePreview" src="#" alt="Image Preview" style="max-width: 400px; display: none;">
    </div>
  </section>
</div>
<footer>
  <p>学号：2200303318 | 姓名：方阳奕 | 班级：22计算机3班 | 联系方式：17758042058</p>
  <p>&copy; 2023. All rights reserved.</p>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {
    // 监听上传美食表单的提交事件
    $('#uploadForm').submit(function(event) {
      event.preventDefault(); // 阻止默认提交行为

      // 创建 FormData 对象，将表单数据包装起来
      let formData = new FormData(this);

      // 发起 AJAX 请求
      $.ajax({
        url: $(this).attr('action'), // 提交到的地址
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
          // 更新搜索结果区域
          updateSearchResults(response);

          // 清空表单
          $('#uploadForm')[0].reset();

          // 隐藏图片预览
          $('#imagePreview').attr('src', '').hide();
        },
        error: function(xhr, status, error) {
          console.error('上传美食出错:', error);
          // 可以在这里添加错误处理逻辑，例如显示错误消息
        }
      });
    });

    // 更新搜索结果的函数
    function updateSearchResults(results) {a
      const resultsContainer = $('#search-container ul');
      resultsContainer.empty(); // 清空原有结果

      if (results.length === 0) {
        resultsContainer.append('<p>未找到相关美食</p>');
      } else {
        // 遍历结果并创建新的列表项
        results.forEach(function(item) {
          let listItem = `
            <li>
              <h3>${item.name}</h3>
              <p>${item.description}</p>
              <img src="${item.imageUrl}" alt="${item.name}" style="max-width: 400px;">
            </li>
          `;
          resultsContainer.append(listItem);
        });
      }
    }

    // 监听上传图片文件变化事件，显示预览
    $('#foodImage').change(function() {
      const file = this.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          $('#imagePreview').attr('src', e.target.result).show();
        }
        reader.readAsDataURL(file);
      }
    });
  });
</script>
<style>
  .spot-image {
    width: 400px;
    height: auto;
  }
  #search-container {
    text-align: center;
    margin: 0 auto;
    max-width: 800px;
  }
  #search-container form {
    margin-bottom: 20px;
  }
</style>
</body>
</html>