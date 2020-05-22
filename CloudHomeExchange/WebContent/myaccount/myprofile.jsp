<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Comatible" content="ie-edge">
	<title>Cloud Home Exchange</title>
	<link rel="stylesheet" href="../style/myaccount.css">
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
					<li class="active"><a href="myprofile.jsp">My Account<span>▶</span></a></li>
					<li><a href="../myhouse/index.jsp">My House</a></li>
					<li><a href="../myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="../contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="mytitle">
					<span>My Profile</span>
				</div>
				<div class="myprofile">
					<div class="profile_form">
						<form id="edit_profile" class="edit_profile" method="post" action="../updateUser">
							<div class="profile_input">
								<span>First name</span>
								<input type="text" name="firstname" placeholder="" required>
							</div>
							<div class="profile_input">
								<span>Last name</span>
								<input type="text" name="lastname" placeholder="">
							</div>
							<div class="profile_input">
								<span>Email</span>
								<input type="text" name="email" placeholder="" required>
							</div>
							<div class="profile_input">
								<span>Telephone</span>
								<input type="text" name="tel" placeholder="" required>
							</div>
							<div class="profile_input">
								<span>Date of Birth</span>
								<input type="text" name="birthday" placeholder="" required>
							</div>
							<div class="profile_input">
								<span>Sex</span>
								<div class="sex">
									<input type="radio" name="sex" value="male" required>Male
								</div>
								<div class="sex">
									<input type="radio" name="sex" value="female" required>Female
								</div>
							</div>
							<div class="profile_submit">
								<input type="submit" name="submit" value="Update">
							</div>
						</form>
					</div>
					<div class="other_profile">
						<div class="ty_traval">
							<span>Type of traveller</span>
							<div class="type">
								<input type="radio" name="type" value="family" placeholder="" required>Family
							</div>
							<div class="type">
								<input type="radio" name="type" value="patner" placeholder="" required>Patner
							</div>
							<div class="type">
								<input type="radio" name="type" value="solo" placeholder="" required>Solo
							</div>
							<div class="type">
								<input type="radio" name="type" value="group" placeholder="" required>Group
							</div>
						</div>
						<div class="dream">
							<span>Dream destinations</span>
							<div class="destination_add">
								<form class="add_form" id="add_form">
									<div class="dream_input">
										<input type="text" name="loc" placeholder="enter a location" required>
									</div>
									<div class="dream_submit">
										<input type="submit" name="submit" value="Add">
									</div>
								</form>
								<div class="show_add">
									<i class="fas fa-map-marker-alt">   Paris</i>
								</div>
							</div>
						</div>
						<div class="picture">
							<span>Profile picture</span>
							<img src="../img/house1.jpg">
							<p>Click your profile picture to replace it</p>
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