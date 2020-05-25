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
	<link rel="stylesheet" href="../style/housedetail.css">
	<link rel="stylesheet" href="../style/common.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://secure.geobytes.com/AutoCompleteCity?key=7c756203dbb38590a66e01a5a3e1ad96&callback=?"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="style/ShowTime.js"></script>
</head>
<body>
<%	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
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
					<li class="active"><a href="../myhouse/index.jsp">My House<span>▶</span></a></li>
					<li ><a href="../myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="../contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="mainresult">

				<div class="result">
				<%
    				String Hid = request.getParameter("Hid");
					String sql = "select * from house where Hid = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, Hid);
					rs = pstmt.executeQuery();
					while (rs.next()) { 
						String Title = rs.getString(3);
						String Detail = rs.getString(4);
						String Features = rs.getString(5);
						int Style = rs.getInt(6);
						int bedrooms = rs.getInt(7);
						int bathrooms = rs.getInt(8);
						int PeopleNum = rs.getInt(9);
						String country = rs.getString(10);
						String city = rs.getString(11);
						String Address = rs.getString(12);
						int Comment = rs.getInt(13);
						String Photo = rs.getString(14);
						int State = rs.getInt(15);
				%>
					<div class="result_house">
						<div class="house_img"><img src="../img/house1.jpg">
						</div>
						<div class="house_detail">
							<div class="house_info">
								<div class="house_location">
									<p>City: <%=city %>, <%=country %></p>	
								</div>
								<div class="house_contact">
									<div class="house_contact_loc">
										<i class="fas fa-search-location">  address: <%=Address %></i>
									</div>
									<br>
									<br>
									<div class="house_contact_mail">
										<i class="far fa-envelope">  xxx@gmail.com</i>
									</div>
									<br>
									<br>
									<div class="house_contact_tel">
										<i class="fas fa-phone-alt">  3312345678</i>
									</div>
								</div>
							</div>
							<form method="post">
							<div class="house_apply">
								<div class="house_apply_input">
									<span>Check in</span>
									<input type="date" name="checkin" required/>
								</div>
								<div class="house_apply_input">
									<span>Check out</span>
									<input type="date" name="checkout" required/>
								</div>
								<div class="house_apply_input">
									<span>Comment</span>
									<textarea maxlength="1000" name="comment" ></textarea>
								</div>
								<input type="text" name="hid" value="<%=Hid %>" hidden/>
								<input type="text" name="uid" value="<%=session.getAttribute("userNickName") %>" hidden/>
							</div>
							<div class="house_apply">
								<input type="button" name="apply" value="Apply" onclick="form.action='';form.submit()">
								<input type="button" name="message" value="Message" onclick="form.action='';form.submit()">
							</div>
							</form>
						</div>
					</div>
					<div class="result_rooms">
						<div class="rooms">
							<i class="fas fa-bed">  <%=bedrooms %> Bedrooms</i>
						</div>
						<div class="rooms">
							<i class="fas fa-users">  <%=PeopleNum %> Sleeps</i>
						</div>
						<div class="rooms">
							<i class="fas fa-bath">  <%=bathrooms %> Bathroom</i>
						</div>
					</div>
					<div class="result_discribe">
						<span>About our home</span>
						<p>The property is situated in a delightful small development in the vibrant, all year round town of Aviemore, and just a few minutes walk from the MacDonald Country Club Resort. Aviemore is in the heart of the Cairngorm National Park and is well known for its stunning scenery, fabulous skiing and climbing, and its funicular railway. Excellent mountain biking trails and 8 golf courses are nearby. Watersports are available at Loch Insh and Loch Morlich and there is fantastic shopping and dining facilities in the nearby town centre. Aviemore has something for everyone!</p>
					</div>
					<div class="result_feature">
						<div class="feature_title">
							<span>Features</span>
						</div>
						<div class="feature">
							<i class="fas fa-wifi">  Wifi</i>
						</div>
						<div class="feature">
							<i class="fas fa-tv">  TV</i>
						</div>
						<div class="feature">
							<i class="fas fa-paw">  No pet</i>
						</div>
						<div class="feature">
							<i class="fas fa-smoking-ban">  No smoking</i>
						</div>
					</div>
					<div class="result_host">
						<div class="dream_title">
							<span>Dream destinations</span>
						</div>
						<div class="destination">
							<i class="fas fa-map-marker-alt">   Paris</i>
						</div>
						<br>
						<div class="destination">
							<i class="fas fa-map-marker-alt">   London</i>
						</div>
						<br>
						<div class="destination">
							<i class="fas fa-map-marker-alt">   Berlin</i>
						</div>

					</div>
				</div>
				<% }  %>
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