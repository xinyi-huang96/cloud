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
	<link rel="stylesheet" href="../style/searchhouse.css">
	<link rel="stylesheet" href="../style/common.css">
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="style/ShowTime.js"></script>
</head>
<body>
	<div class="border_box">
		<div class="header">
			<div class="logo"><img src="../img/cloud.png"></div>
			<div class="title">Cloud Home Exchange</div>
			<div class="login">
				<a href="../myaccount/login.html">Sign out</a>
			</div>
		</div>
		<div class="main_box">
			<div class="left_nav">
				<ul>
					<li><a href="../index.jsp">Home</a></li>
					<li  class="active"><a href="../searching/searchhouse.jsp">Search House<span>▶</span></a></li>
					<li><a href="../myaccount/myprofile.jsp">My Account</a></li>
					<li><a href="../myhouse/index.jsp">My House</a></li>
					<li ><a href="../myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="../contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="mainsearch">
				<div class="search">
					<form id="searchhouse_form" class="searchhouse_form">
						<div class="search_input_city">
							<span>I'd like to stay in </span>
							<input type="text" name="depart" placeholder="e.g. Paris, London" required>
						</div>
						<div class="search_input">
							<span>Check-in</span>
							<input type="date" name="indate" required>
						</div>
						<div class="search_input">
							<span>Check-out</span>
							<input type="date" name="outdate" required>
						</div>
						<div class="search_input">
							<span>Sleeping</span>
							<input type="number" name="number" required>
						</div>
						<div class="submit_search">
							<input type="submit" name="submit" value="Search">
						</div>
					</form>
				</div>
				<div class="recommend_house">
					<div class="recommandation">
						<div class="re_house">
						<div class="re_house_img"><img src="../img/house1.jpg" width="280px" height="220px"></div>
						<div class="re_house_discribe">this is good</div>
						<div class="re_house_comment">❤❤❤❤❤</div>
						</div>
					</div>
					<div class="recommandation">
						<div class="re_house">
						<div class="re_house_img"><img src="../img/house2.jpg" width="280px" height="220px"></div>
						<div class="re_house_discribe">this is good</div>
						<div class="re_house_comment">❤❤❤❤❤</div>
						</div>
					</div>
					<div class="recommandation">
						<div class="re_house">
						<div class="re_house_img"><img src="../img/house3.jpg" width="280px" height="220px"></div>
						<div class="re_house_discribe">this is good</div>
						<div class="re_house_comment">❤❤❤❤❤</div>
						</div>
					</div>
					<div class="recommandation">
						<div class="re_house">
						<div class="re_house_img"><img src="../img/house4.jpg" width="280px" height="220px"></div>
						<div class="re_house_discribe">this is good</div>
						<div class="re_house_comment">❤❤❤❤❤</div>
						</div>
					</div>
					<div class="recommandation">
						<div class="re_house">
						<div class="re_house_img"><img src="../img/house5.jpg" width="280px" height="220px"></div>
						<div class="re_house_discribe">this is good</div>
						<div class="re_house_comment">❤❤❤❤❤</div>
						</div>
					</div>
					<div class="recommandation">
						<div class="re_house">
						<div class="re_house_img"><img src="../img/house6.jpg" width="280px" height="220px"></div>
						<div class="re_house_discribe">this is good</div>
						<div class="re_house_comment">❤❤❤❤❤</div>
						</div>
					</div>
				</div>
				<div class="search_map">
					
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
</body>
</html>