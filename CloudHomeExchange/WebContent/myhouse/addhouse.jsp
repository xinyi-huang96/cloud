<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Comatible" content="ie-edge">
	<title>Cloud Home Exchange</title>
	<link rel="stylesheet" href="../style/addhouse.css">
	<link rel="stylesheet" href="../style/common.css">
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="../style/showPhoto.js"></script>
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
				<div class="mytitle">
					<span>Add house</span>
				</div>
				<div class="myhouse">
					<div class="house_form">
						<form id="edit_house" class="edit_house">
							<div class="house_input_title">
								<span>Title</span>
								<input type="text" name="title" placeholder="title" required>
							</div>
							<div class="house_input_discribe">
								<span>Tell us about your house</span>
								<input type="text" name="discribe" placeholder="" required>
							</div>
							<div class="house_input_feature">
								<span>Features</span>
								<div class="input_feature">
									<input  type="checkbox" name="wifi" value="male">Wifi
								</div>
								<div class="input_feature">
									<input type="checkbox" name="pool" value="male">TV
								</div>
								<div class="input_feature">
									<input type="checkbox" name="pool" value="male">NO smoking
								</div>
								<div class="input_feature">
									<input type="checkbox" name="pool" value="male">For kid
								</div>
								<div class="input_feature">
									<input type="checkbox" name="pool" value="male">Washing
								</div>
							</div>
							<div class="house_input_style">
								<span>Home style</span>
								<div class="input_style">
									<input type="radio" name="citypad" value="male" required>City pad
								</div>
								<div class="input_style">
									<input type="radio" name="bythesea" value="female" required>By the sea
								</div>
								<div class="input_style">
									<input type="radio" name="bythesea" value="female" required>Countryside
								</div>
								<div class="input_style">
									<input type="radio" name="bythesea" value="female" required>Mountain
								</div>
								<div class="input_style">
									<input type="radio" name="bythesea" value="female" required>Spring water
								</div>
							</div>
							<div class="house_input_rooms">
								<div class="input_room">
									<div class="input_number">
										<span>Bedrooms</span>
										<input type="" name="">
									</div>
									<div class="input_number">
										<span>Bathrooms</span>
										<input type="" name="">
									</div>
									<div class="input_number">
										<span>Sleeps</span>
										<input type="" name="">
									</div>
								</div>
								<div class="input_room_allow">
									<div class="input_allows">
										<span>Pets</span>
										<input type="" name="">
									</div>
									<div class="input_allows">
										<span>Kids</span>
										<input type="" name="">
									</div>
								</div>
							</div>
							<div class="house_input_photos">
								<div class="photo_add">
									<button>Add Photo</button>
									<span>photo</span>
									<input type="file" name="file" id="file" class="inputfile" accept="image/*" onchange="changepic(this)" multiple="multiple" />
									<img src="" id="show" width="200">
								</div>
								<div class="show_photo">
									<img src="../img/logo.png">
									<span>delete</span>
								</div>
								<div class="show_photo">
									<img src="../img/logo.png">
									<span>delete</span>
								</div>
							</div>
							<div class="house_submit">
								<input type="submit" name="submit" value="Add">
							</div>
						</form>
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