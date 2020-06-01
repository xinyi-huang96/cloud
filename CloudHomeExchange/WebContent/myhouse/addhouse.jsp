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
	<link rel="stylesheet" href="../style/edithouse.css">
	<link rel="stylesheet" href="../style/common.css">
	<link rel="stylesheet" type="text/css" href="../style/magic-check.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="../style/showPhoto.js"></script>
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
				<a href="../myaccount/login.jsp">Sign out</a>
			<%	} else { %>
				<a href="../myaccount/login.jsp">Log in</a>
			<%	} %>
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
					<li><a href="../contact/messagecenter.jsp">Message</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="mytitle">
					<span>Add house</span>
					<!-- <a href="index.jsp"><button>back</button></a> -->
				</div>
				<div class="myhouse">
					<div class="house_form">
						<form id="edit_house" class="edit_house" action="../addHouse" method="post"  enctype="multipart/form-data">
							<div class="house_input_title">
								<span>Title</span>
								<input type="text" name="title" placeholder="title" required>
							</div>
							<div class="house_input_add">
								<div class="house_input_address1">
									<span>Address</span>
								</div>
								<div class="house_input_address2">
									<div class="house_input_city">
									<span>Country</span>
									<input type="text" name="country" placeholder="" required>
								</div>
								<div class="house_input_city">
									<span>City</span>
									<input type="text" name="city" placeholder="" required>
								</div>
								
								</div>
								
							</div>
							<div class="house_input_Cadd">
									<span>Complete Address</span>
									<input type="text" name="address" placeholder="" required>
								</div>
							<div class="house_input_discribe">
								<span>Tell us about your house</span>
								<textarea maxlength="1000" name="describe" required></textarea>
							</div>
							<div class="house_input_feature">
								<span>Features</span>
								<div class="input_feature">
									<input  class="magic-checkbox" type="checkbox" name="feature" id="c1" value="Wifi">
									<label for="c1">Wifi</label>
								</div>
								<div class="input_feature">
									<input class="magic-checkbox" type="checkbox" name="feature" id="c2" value="TV">
									<label for="c2">TV</label>								</div>
								<div class="input_feature">
									<input class="magic-checkbox" type="checkbox" name="feature" id="c3" value="NoSmoking">
									<label for="c3">NO smoking</label>
								</div>
								<div class="input_feature">
									<input class="magic-checkbox" type="checkbox" name="feature" id="c4" value="Kid">
									<label for="c4">For kid</label>
								</div>
								<div class="input_feature">
									<input class="magic-checkbox" type="checkbox" name="feature" id="c5" value="Washing">
									<label for="c5">Washing</label>
								</div>
							</div>
							<div class="house_input_style">
								<span>Home style</span>
								<div class="input_style">
									<input class="magic-radio" type="radio" name="style" id="r1" value="CityPad" required>
									<label for="r1">City pad</label>
								</div>
								<div class="input_style">
									<input class="magic-radio" type="radio" name="style" id="r2" value="ByTheSea" required>
									<label for="r2">By the sea</label>
								</div>
								<div class="input_style">
									<input class="magic-radio" type="radio" name="style" id="r3" value="Countryside" required>
									<label for="r3">Countryside</label>
								</div>
								<div class="input_style">
									<input class="magic-radio" type="radio" name="style" id="r4" value="Mountain" required>
									<label for="r4">Mountain</label>
								</div>
								<div class="input_style">
									<input class="magic-radio" type="radio" name="style" id="r5" value="SpringWater" required>
									<label for="r5">Spring water</label>
								</div>
							</div>
							<div class="house_input_rooms">
								<div class="input_room">
									<div class="input_number">
										<span>Bedrooms</span>
										<input type="number" name="bedroom" min="1" max="10">
									</div>
									<div class="input_number">
										<span>Bathrooms</span>
										<input type="number" name="bathroom" min="1" max="10">
									</div>
									<div class="input_number">
										<span>Max Number</span>
										<input type="number" name="people" min="1" max="20">
									</div>
								</div>
								<div class="input_photo">
									<div class="photo_add">
										<span>photo</span>
										<input type="file" name="file" id="file" class="inputfile" accept="image/*" onchange="changepic(this)" multiple="multiple" />
										<img src="" id="show" width="180">
									</div>
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
					<li><a href="contact/send.jsp">Contact us</a></li>
					<li><a href="contact/about.jsp">About us</a></li>
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
<%	} %>
</body>
</html>