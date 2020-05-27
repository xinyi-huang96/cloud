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
	<link rel="stylesheet" href="../style/myaccount.css">
	<link rel="stylesheet" href="../style/common.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../style/adddream.js" type="text/javascript"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"> </script>
	<script type="text/javascript" src="../style/myaccount.js"></script>
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
				<a>Welcome, <% out.print(session.getAttribute("userNickName")); %></a>
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
				<%	String sql = "select * from user where Uid = ?";
					pstmt = conn.prepareStatement(sql);
					String userId = (String)session.getAttribute("userId");
					pstmt.setString(1, userId);
					rs = pstmt.executeQuery();
					while (rs.next()) { 
						String NickName = rs.getString(2);
						int Gender = rs.getInt(4);
						String Birth = rs.getString(5);
						String Email = rs.getString(6);
						int Telephone = rs.getInt(7);
				%>
				<div class="myprofile">	
					<div class="profile_form">
						<form id="edit_profile" class="edit_profile" method="post" action="../updateUser">
							<div class="profile_input">
								<span>Your name</span>
								<input type="text" name="firstname" value="<% out.print(NickName); %>" required>
							</div>
							<div class="profile_input">
								<span>Email</span>
								<input type="text" name="email" value="<% out.print(Email); %>" readonly unselectable="on">
							</div>
							<div class="profile_input">
								<span>Telephone</span>
								<input type="text" name="tel" value="<% out.print(Telephone); %>" required>
							</div>
							<div class="profile_input">
								<span>Date of Birth</span>
								<input type="date" name="birthday" value="<% out.print(Birth); %>" required>
							</div>
							<div class="profile_input">
								<span>Sex</span>
								<div class="sex">
									<input type="radio" name="sex" value="male" required
									<%	if (Gender == 1) {%> checked <%	} %>>Male
								</div>
								<div class="sex">
									<input type="radio" name="sex" value="female" required 
									<%	if (Gender == 0) {%> checked <%	} %>>Female
								</div>
							</div>
							<div class="profile_submit">
								<input type="submit" name="submit" value="Update">
							</div>
						</form>
						<div class="editPassword">
							<button id="modPsw" οnclick="show()">Modify password</button>
						</div>
						<div id="edit_psw" class="edit_psw">
							<form method="post" action="../modifyPsw">
							<div class="profile_input">
								<span>Current password</span>
								<input type="password" name="cpsw" required>
							</div>
							<div class="profile_input">
								<span>New password</span>
								<input type="password" name="npsw" required>
							</div>
							<div class="profile_input">
								<span>Repeat password</span>
								<input type="password" name="renpsw" required>
							</div>
							<div class="profile_submit">
								<input type="submit" name="submit" value="Modify">
							</div>
						</form>
						</div>
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
										<input type="submit" name="submit" value="Add" onClick="adddream()">
									</div>
								</form>
								<div class="show_add">
									<i class="fas fa-map-marker-alt">   Paris</i>
								</div>
							</div>
						</div>
						<div class="picture">
							<span>Profile picture</span>
							<div class="photo_add">
										<span>photo</span>
										<input type="file" name="file" id="file" class="inputfile" accept="image/*" onchange="changepic(this)" multiple="multiple" />
										<img src="" id="show" width="180">
									</div>
						</div>
						<%	} %>
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