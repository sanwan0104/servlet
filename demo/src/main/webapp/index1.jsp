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
		<p style="color: #333333">基于Java的Web开发期末大作业</p>
	</a>
</header>
<nav>
	<ul>
		<li><a href="index1.jsp"  >基本信息</a></li>
		<li><a href="index2.jsp">擅长类型</a></li>
		<li><a href="food.jsp" >家乡特产和美食</a></li>
		<li><a href="scenery.jsp">家乡旅游景点</a></li>
	</ul>
</nav>
<!-- 导航栏 -->


<div class="layuimini-container">
	<div class="layuimini-main" >
		<p style="clear:both"></p>
		<div style="width:60%;background:#FFF;margin:auto;padding:1% 0" id="DownLoadPDF">
			<table id="table1" align="center" cellpadding="10" cellspacing="0" >
				<colgroup>
					<col width=10%></col>
					<col width=20%></col>
					<col width=20%></col>
					<col width=20%></col>
					<col width=20%></col>
					<col width=10%></col>
				</colgroup>
				<tr>
					<td rowspan="6" colspan="2" style="padding: 0 !important">
						<img id="headSculpture" src="me.jpg" style=" width: 220px; height: 280px;margin: auto;">
					</td>


				</tr>

				<tr>

					<td align="center" style="padding: 0 !important;">专家评分:</td>
					<td><div id="test4" style="line-height: 20px; padding: 0 !important;"></div>100</td>
					<td align="center">出生年月:</td>
					<td class="birth tdLeft">2004/01/01</td>

				</tr>

				<tr>

					<td align="center">手机号码:</td>
					<td class="phone tdLeft">111200313</td>
					<td align="center">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>

					<td class="Sex tdLeft" align="center">男</td>
				</tr>
				<tr>

					<td align="center">工作单位:</td>
					<td class="Place tdLeft">M78星云</td>
					<td align="center">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历:</td>
					<td class="Education tdLeft">本科</td>
				</tr>
				<tr>

					<td align="center">政治面貌:</td>
					<td class="politicalStatus tdLeft">群众</td>
					<td align="center">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</td>
					<td class="Titles tdLeft">奥特曼</td>
				</tr>
				<tr>
					<td align="center">邮址邮编:</td>
					<td colspan="4" class="ExpressAddress tdLeft" style="text-align:left !important">311012</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align:left;">
						<div style="padding: 0 1%;">
							<h1>基本信息</h1>
							<hr class="layui-border-black" style="margin:0 !important;">
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
					<td class="fullName tdLeft">迪迦</td>
					<td>出生年月:</td>
					<td class="birth tdLeft">2004/01/01</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
					<td class="Sex tdLeft">男</td>
					<td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:</td>
					<td class="DegreeIn tdLeft">本科</td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td align="center">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历:</td>
					<td class="Education tdLeft">本科</td>
					<td>参加工作时间:</td>
					<td class="WorkTime tdLeft">2026.01.02</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</td>
					<td class="Titles tdLeft">奥特曼</td>
					<td>民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族:</td>
					<td class="Nationality tdLeft">汉</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">政治面貌:</td>
					<td class="politicalStatus tdLeft">群众</td>
					<td>所学专业:</td>
					<td class="Major tdLeft">计算机</td>
					<td></td>
				</tr>


				<tr>
					<td></td>
					<td align="center">工作单位:</td>
					<td class="Place tdLeft">奥特之星</td>
					<td>是否是上届督学:</td>
					<td class="sjdx tdLeft">是</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">手机号码:</td>
					<td class="phone tdLeft">111200313</td>
					<td>工作电话:</td>
					<td class="tel tdLeft">1112312413</td>
					<td></td>
				</tr>





			</table>
			<h2>留言板</h2>
			<form action='AddMessageServlet' method='post'>
				留言者：<input type='text' name='peopleName' size='40' required/><br>
				标题：<input type='text' name='title' size='42' required/><br>
				留言：<br>
				<textarea name='contents' rows='10' cols='36' wrap='physical' required></textarea><br>
				<input type='submit' value='提交留言'/>
				<a href='ShowMessagesServlet'>查看留言</a>
			</form>
			<br>

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
