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
	<link rel="stylesheet" href="../style/myapply.css">
	<link rel="stylesheet" href="../style/common.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://secure.geobytes.com/AutoCompleteCity?key=7c756203dbb38590a66e01a5a3e1ad96&callback=?"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
</head>
<body>
<%	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Conn DBConn = new Conn();
	conn = DBConn.getConnection();
	if(conn != null){
%>
	<div class="border_box">
		<div class="header">
			<div class="logo"><img src="../img/cloud.png"></div>
			<div class="title">Cloud Home Exchange</div>
			<div class="login">
				<%	if (session.getAttribute("userNickName") != null) {
			%>
				<a>Welcome, <%=session.getAttribute("userNickName") %></a>
				<a href="../myaccount/login.html">Sign out</a>
			<%	} else { %>
				<a href="../myaccount/login.html">Log in</a>
			<%	} %>
			</div>
		</div>
		<div class="main_box">
			<div class="left_nav">
				<ul>
					<li><a href="../index.jsp">Home</a></li>
					<li><a href="../searching/searchhouse.jsp">Search House</a></li>
					<li><a href="../myaccount/myprofile.jsp">My Account</a></li>
					<li><a href="../myhouse/index.jsp">My House</a></li>
					<li class="active"><a href="../myapply/index_applied.jsp">My Apply<span>▶</span></a></li>
					<li><a href="../contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="mytitle">
					<a class="active" href="index_applied">Applied</a>
					<a href="index_received.jsp">Received</a>
					<a href="index_history.jsp">History</a>
				</div>
				<div class="myapply">
					<div class="house_img">
						<img src="../img/house1.jpg">
					</div>
					<div class="apply_detail">
						<div class="house_location">
							<p>Paris, France</p>
						</div>
						<div class="apply_status">
							<p>status: </p>
							<p>accepted</p>
						</div>
						<div class="apply_process">
								
						</div>
						<div class="apply_time">
								
						</div>
					</div>
				</div>
				<div class="myapply">
					<div class="house_img">
						<img src="../img/house2.jpg">
					</div>
					<div class="apply_detail">
						<div class="house_location">
							<p>Paris, France</p>
						</div>
						<div class="apply_status">
							<p>status: </p>
							<p>accepted</p>
						</div>
						<div class="apply_process">
								
						</div>
						<div class="apply_time">
								
						</div>
					</div>
				</div>
				<div class="myapply">
					<div class="house_img">
						<img src="../img/house3.jpg">
					</div>
					<div class="apply_detail">
						<div class="house_location">
							<p>Paris, France</p>
						</div>
						<div class="apply_status">
							<p>status: </p>
							<p>accepted</p>
						</div>
						<div class="apply_process">
								
						</div>
						<div class="apply_time">
								
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="footer_logo">
				<img src="../img/cloud.png">
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
		<div class="foot">Â© Copyright 2020</div>
	</div>
	<%	} %>
</body>
</html>