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
	<link rel="stylesheet" href="../style/register.css">
	<script type="text/javascript" src="../scripts/jquery-3.4.1.min.js"></script>
	<script src="../style/check.js" type="text/javascript"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="style/ShowTime.js"></script>
</head>
<%	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	Conn DBConn = new Conn();
	conn = DBConn.getConnection();
%>
<body>
	<div class="border_box">
		<div class="header">
			<div class="logo_middle"><img src="../img/cloud.png">
				<br><span  style="font-size:20px;"><strong>Cloud Home Exchange</strong></span>
			</div>
			<div class="login">
				<span>Already a user?</span>
				<a href="../myaccount/login.jsp">Sign in</a>
			</div>
		</div>
		<div class="main_box">
			<div class="register">
				<form id="register_form" class="register_form" action="../register" method="post">
					<div class="register_input">
						<input type="text" id="email" name="email" placeholder="   Email Address" onblur="checkEmail()" required/>
						<div class="prompt" id="email_prompt"></div>
					</div>
					<div class="register_input">
						<input type="password" id="psw" name="psw" placeholder="   Password" onblur="checkPwd()" required/>
						<div class="prompt" id="pwd_prompt"></div>
					</div>
					<div class="register_input">
						<input type="password" id="repsw" name="repsw" placeholder="   Confirm Password" onblur="checkRepwd()" required/>
						<div class="prompt" id="repwd_prompt"></div>
					</div>
					<div class="register_input">
						<input type="date" name="birth" placeholder="   Date of Birth" required/>
					</div>
					<div class="register_input_sex">
						<div class="input_sex">
							<input type="radio" name="sex" value="male" required>Male
						</div>
						<div class="input_sex">
							<input type="radio" name="sex" value="female" required>Female
						</div>
					</div>
					<div class="register_service">
						<div class="service">
							<input type="radio" name="service" value="read" required>I accept the <span>Terms of Service</span> and the <span>Professional Terms of Service.</span>
						</div>
					</div>
					<div class="register_submit">
						<input type="submit" name="submit" value="Sign up">
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
		<div class="foot"> © Copyright 2020</div>
	</div>
</body>
</html>