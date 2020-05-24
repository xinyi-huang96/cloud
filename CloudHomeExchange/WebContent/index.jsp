<%@page import="com.util.Conn"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Comatible" content="ie-edge">
	<title>Cloud Home Exchange</title>
	<link rel="stylesheet" href="style/index.css">
	<link rel="stylesheet" href="style/common.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://secure.geobytes.com/AutoCompleteCity?key=7c756203dbb38590a66e01a5a3e1ad96&callback=?"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="style/city.js"></script>
</head>
<body>
<%	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	Conn DBConn = new Conn();
	conn = DBConn.getConnection();
	if(conn != null){
%>
	<div class="border_box">
		<div class="header">
			<div class="logo"><img src="img/cloud.png"></div>
			<div class="title">Welcome
			<br>Cloud Home Exchange</div>
			<div class="login">
			<%	Object userNickName = session.getAttribute("userNickName");
				if (userNickName != null) {
			%>
				<a>Welcome, <% out.print(userNickName); %></a>
				<a href="myaccount/login.html">Sign out</a>
			<%	} else { %>
				<a href="myaccount/login.html">Log in</a>
			<%	} %>
			</div>
		</div>
		<div class="main_box">
			<div class="left_nav">
				<ul>
					<li  class="active"><a href="index.jsp">Home<span>▶</span></a></li>
					<li><a href="searching/searchhouse.jsp">Search House</a></li>
					<li><a href="myaccount/myprofile.jsp">My Account</a></li>
					<li><a href="myhouse/index.jsp">My House</a></li>
					<li><a href="myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="search" style="background:url('img/search_bg.png') no-repeat 0 0;">
					<form id="search_form" class="search_form">
						<div class="search_span">Le monde est tellement grand, Allez pour voir.</div>
						<div class="search_span_info">
							<div class="search_input">
								<span>My home is in...</span>
								<input type="text" id="cityjson1" name="depart" placeholder="Enter your country or city" required>
							</div>
							<div class="search_input">
								<span>I'd love to see...</span>
								<input type="text" id="cityjson2" name="arrive" placeholder="Anywhere" required>
							</div>
						</div>
						<div class="submit_search">
							<input type="submit" name="submit" value="Show me some choices">
						</div>
					</form>
				</div>
				<div class="recommend_house">
					<div class="re_title">Recommend House</div>
					<div class="recommandation">
						<div class="re_house">
						<div class="re_house_img"><img src="img/house1.jpg" width="280px" height="220px"></div>
						<div class="re_house_discribe">this is good</div>
						<div class="re_house_comment">❤❤❤❤❤</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="footer_logo">
				<img src="img/cloud.png">
			</div>
			<div class="footer_nav">
				<ul>
					<li><a href="#">About</a></li>
					<li><a href="#">About us</a></li>
				</ul>
			</div>
			<div class="social_media">
				<i class="fab fa-twitter fa-2x"></i>
				<i class="fab fa-instagram fa-2x"></i>
				<i class="fab fa-facebook-square fa-2x"></i>
			</div>
		</div>
		<div class="foot">© Copyright 2020</div>
	</div>
<%	} %>
</body>
</html>