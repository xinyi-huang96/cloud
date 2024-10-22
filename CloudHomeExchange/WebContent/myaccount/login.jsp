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
	<link rel="stylesheet" href="../style/common.css">
	<link rel="stylesheet" href="../style/login.css">
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="style/ShowTime.js"></script>
</head>
<%	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	Conn DBConn = new Conn();
	conn = DBConn.getConnection();
	DBConn.closeConnection(conn);
%>
<body>
	<div class="border_box">
		<div class="header">
			<div class="logo_middle"><img src="../img/cloud.png">
				<br><span  style="font-size:20px;"><strong>Cloud Home Exchange</strong></span>
			</div>
			<div class="login">
				<a href="../myaccount/register.jsp">Sign up</a>
			</div>
		</div>
		<div class="main_box">
			<div class="loginpart">
				<form id="login_form" class="login_form" method="post" action="../login">
					<div class="login_input">
						<input type="text" name="email" placeholder="   Email Address" required>
					</div>
					<div class="login_input">
						<input type="password" name="psw" placeholder="   Password" required>
					</div>
					<div class="login_submit">
						<input type="submit" name="submit" value="Log in" >
					</div>
				</form>
			</div>
		</div>
		<div class="footer">
			<div class="footer_logo">
				<img src="../img/cloud.png">
			</div>
			<div class="footer_nav">
				<ul>
					<li><a href="../contact/send.jsp">Contact us</a></li>
					<li><a href="../contact/about.jsp">About us</a></li>
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
</body>
</html>