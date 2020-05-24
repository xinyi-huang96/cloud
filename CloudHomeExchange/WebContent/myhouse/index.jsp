jsp<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Comatible" content="ie-edge">
	<title>Cloud Home Exchange</title>
	<link rel="stylesheet" href="../style/myhouse.css">
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
					<li><a href="../searching/searchhouse.jsp">Search House</a></li>
					<li><a href="../myaccount/myprofile.jsp">My Account</a></li>
					<li class="active"><a href="../myhouse/index.jsp">My House<span>▶</span></a></li>
					<li ><a href="../myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="../contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="myhouse">
					<div class="house_img">
						<img src="../img/house1.jpg">
					</div>
					<div class="house_detail">
						<div class="house_info">
							<div class="house_location">
								<p>Paris, France</p>
							</div>
							<div class="house_contact">
								<div class="house_contact_loc"></div>
								<div class="house_contact_mail"></div>
								<div class="house_contact_tel"></div>
							</div>
						</div>
						<div class="house_apply">
							<button><a href="../myhouse/edithouse.jsp">Edit</a></button>
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
		<div class="foot">© Copyright 2020</div>
	</div>
</body>
</html>