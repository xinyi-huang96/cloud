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
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="style/ShowTime.js"></script>
</head>
<body>
<%	Connection conn = null;
	Statement stmt = null;
	ResultSet rs1,rs2 = null;
	PreparedStatement pstmt1,pstmt2 = null;
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
					<li><a href="../contact/messagecenter.jsp">Message</a></li>
				</ul>
			</div>
			<div class="mainresult">

				<div class="result">
				<%
    				String Hid = request.getParameter("Hid");
					String sql1 = "select * from house where Hid = ? AND State = 1;";					
					pstmt1 = conn.prepareStatement(sql1);
					pstmt1.setString(1, Hid);					
					rs1 = pstmt1.executeQuery();
					while (rs1.next()) { 
						String Uid = rs1.getString(2);
						String Title = rs1.getString(3);
						String Detail = rs1.getString(4);
						String Features = rs1.getString(5);
						String[] feature = {" "};
						if (Features != null) {
							
						    String delimeter = "\\|";
						    feature = Features.split(delimeter);
						}					    					    
						int Style = rs1.getInt(6);
						int bedrooms = rs1.getInt(7);
						int bathrooms = rs1.getInt(8);
						int PeopleNum = rs1.getInt(9);
						String country = rs1.getString(10);
						String city = rs1.getString(11);
						String Address = rs1.getString(12);
						String Photo = rs1.getString(13);
						int Comment = rs1.getInt(14);
						
						int State = rs1.getInt(15);
						String sql2 = "select * from user where Uid = ?";
						pstmt2 = conn.prepareStatement(sql2);
						pstmt2.setString(1, Uid);
						rs2 = pstmt2.executeQuery();
						rs2.next();
						String NickName = rs2.getString(2);
						String Email = rs2.getString(6);
						String Telephone = rs2.getString(7);
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
										<i class="fas fa-search-location">  Address: <%=Address %></i>
									</div>
									<br>
									<br>
									<div class="house_contact_mail">
										<i class="far fa-envelope">  Email: <%= Email %></i>
									</div>
									<br>
									<br>
									<div class="house_contact_tel">
										<i class="fas fa-phone-alt">  Tel:<%= Telephone %></i>
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
								<input type="text" name="uid" value="<%=session.getAttribute("userId") %>" hidden/>
							</div>
							<div class="house_apply">
								<input type="button" name="apply" value="Apply" onclick="this.form.action='../createOrder';this.form.submit()">
								<input type="button" name="message" value="Message" onclick="this.form.action='../contact/message.jsp?receiver=<%=Uid %>';this.form.submit()">
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
						<p> <%=Detail %></p>
					</div>
					<div class="result_feature">
						<div class="feature_title">
							<span>Features</span>
						</div>
						<% for (String str : feature) {
							if (str.equals("Wifi")){
						%>
						<div class="feature">
							<i class="fas fa-wifi">  Wifi</i>
						</div>
						<% }  if (str.equals("TV")){%>
						<div class="feature">
							<i class="fas fa-tv">  TV</i>
						</div>
						<% }  if (str.equals("Kid")){%>
						<div class="feature">
							<i class="fas fa-paw">  For kid</i>
						</div>
						<% }  if (str.equals("NoSmoking")){%>
						<div class="feature">
							<i class="fas fa-smoking-ban">  No smoking</i>
						</div>
						<% }  if (str.equals("Washing")){%>
						<div class="feature">
							<i class="fas fa-paw">  Washing</i>
						</div>
						<% } }%>
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