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
				<a href="myaccount/login.html">Sign out</a>
			<%	} else { %>
				<a href="myaccount/login.html">Log in</a>
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
					<li><a href="../contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="mytitle">
					<span>Add house</span>
					<!-- <a href="index.jsp"><button>back</button></a> -->
				</div>
				<div class="myhouse">
					<div class="house_form">
						<form id="edit_house" class="edit_house">
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
								<textarea maxlength="1000" name="discribe" required></textarea>
							</div>
							<div class="house_input_feature">
								<span>Features</span>
								<div class="input_feature">
									<input  type="checkbox" name="feature" value="Wifi">Wifi
								</div>
								<div class="input_feature">
									<input type="checkbox" name="feature" value="TV">TV
								</div>
								<div class="input_feature">
									<input type="checkbox" name="feature" value="NoSmoking">NO smoking
								</div>
								<div class="input_feature">
									<input type="checkbox" name="feature" value="Kid">For kid
								</div>
								<div class="input_feature">
									<input type="checkbox" name="feature" value="Washing">Washing
								</div>
							</div>
							<div class="house_input_style">
								<span>Home style</span>
								<div class="input_style">
									<input type="radio" name="style" value="CityPad" required>City pad
								</div>
								<div class="input_style">
									<input type="radio" name="style" value="ByTheSea" required>By the sea
								</div>
								<div class="input_style">
									<input type="radio" name="style" value="Countryside" required>Countryside
								</div>
								<div class="input_style">
									<input type="radio" name="style" value="Mountain" required>Mountain
								</div>
								<div class="input_style">
									<input type="radio" name="style" value="SpringWater" required>Spring water
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
										<span>Max Number</span>
										<input type="" name="">
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
		<div class="foot"> © Copyright 2020</div>
	</div>
<%	} %>
</body>
</html>