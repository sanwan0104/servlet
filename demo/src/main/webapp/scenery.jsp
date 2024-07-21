<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>家乡旅游景点</title>
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
            <li><a href="index2.html">擅长类型</a></li>
            <li><a href="food.jsp">家乡特产和美食</a></li>
            <li><a href="scenery.jsp">家乡旅游景点</a></li>
        </ul>
    </nav>

    <div id="content">
        <section id="tourism">
            <h2>家乡旅游景点</h2>
            <div class="grid-container">
                <div class="grid-item">
                    <img src="images/scenery1.jpg" alt="景点1">
                    <img src="images/scenery2.jpg" alt="景点2">
                    <img src="images/scenery3.jpg" alt="景点3">
                    <img src="images/scenery4.jpg" alt="景点4">
                </div>
            </div>
            <div id="search-container">
                <h1>景点搜索结果</h1>

                <form method="post" action="scenerySearch">
                    <label for="keyword">输入关键词：</label>
                    <input type="text" id="keyword" name="keyword" placeholder="请输入关键词">
                    <button type="submit">搜索</button>
                </form>

                <hr>

                <h2>搜索结果：</h2>
                <ul>
                    <%@ page import="java.util.List" %>
                    <%@ page import="com.example.demo.ScenicSpot" %>
                    <% List<ScenicSpot> results = (List<ScenicSpot>) request.getAttribute("results");
                        if (results != null && !results.isEmpty()) {
                            for (ScenicSpot spot : results) {
                    %>

                    <li>
                        <h3><%= spot.getName() %></h3>
                        <p><%= spot.getDescription() %></p>
                        <img src="<%= spot.getImageUrl() %>" alt="<%= spot.getName() %>" class="spot-image">
                    </li>
                    <%
                        }
                    } else {
                    %>
                    <li>未找到相关景点</li>
                    <% } %>
                </ul>
                <div align="center">
                    <img src="images/scenery1.jpg" alt="家乡景点1">
                    <h3>西湖</h3>
                    <p>上有天堂，下有苏杭。西湖是杭州的第一张名片，也是全国唯一个不收费的5A级旅游景区，2007年杭州市西湖风景名胜区被评为国家5A级旅游景区，2011年6月24日，杭州西湖文化景观正式被列入《世界遗产名录》。</p>
                    <img src="images/scenery2.jpg" alt="家乡景点2">
                    <h3>良渚文化村</h3>
                    <p>良渚文化村里有良渚文化博物院、良渚文化中心，晓书馆，良渚古城遗址等。2019年7月“良渚古城遗址”成功列入《世界遗产名录》，正式成为中国第55处世界遗产，被誉为“证实中华五千年文明史的圣地”。</p>
                    <img src="images/scenery3.jpg" alt="家乡景点3">
                    <h3>钱江新城</h3>
                    <p>说到钱江新城，就一定要给大家说到灯光秀，G20峰会的时候，有一场著名的灯光秀展演震惊了海内外，峰会结束之后，这个灯光秀也保留下来了供市民免费观看，在每个周的周三，周五，周六晚上七点半，八点半各一场，每场大约半个小时。</p>
                    <img src="images/scenery4.jpg" alt="家乡景点4">
                    <h3>中国美院象山校区</h3>
                    <p>杭州除了有浙大，还有电影《80后》的取景地-中国美院象山校区，位于杭州市西湖区，其中最著名的就是大红墙了。</p>
                </div>
            </div>
        </section>

        <section id="video">
            <h2>视频播放</h2>
            <video controls>
                <source src="video.mp4" type="video/mp4">
            </video>
        </section>
    </div>

    <footer>
        <p>学号：2200303318 | 姓名：方阳奕 | 班级：22计算机3班 | 联系方式：17758042058</p>
        <p>&copy; 2023. All rights reserved.</p>
    </footer>

    <script src="script.js"></script>
    <style>
        /* CSS 样式，用于放大图片 */
        .spot-image {
            width: 400px; /* 设置图片宽度 */
            height: auto; /* 根据宽度自动调整高度，保持比例 */
        }

        /* Center-align the search container */
        #search-container {
            text-align: center; /* Center-align text and inline-block elements */
            margin: 0 auto; /* Center the container horizontally */
            max-width: 800px; /* Optional: Set a maximum width for the container */
        }

        /* Optional: Adjust styles for other elements */
        #search-container form {
            margin-bottom: 20px; /* Add space below the form */
        }
    </style>

</body>
</html>
