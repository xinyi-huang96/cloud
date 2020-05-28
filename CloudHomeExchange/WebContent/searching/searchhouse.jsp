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
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="style/city.js"></script>
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
					<li  class="active"><a href="../searching/searchhouse.jsp">Search House<span>▶</span></a></li>
					<li><a href="../myaccount/myprofile.jsp">My Account</a></li>
					<li><a href="../myhouse/index.jsp">My House</a></li>
					<li ><a href="../myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="../contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="mainsearch">
				<div class="search">
				
					<%	
					
						
						String cityString = "";
						int Sleeps = 0;
					  if (request.getParameter("arrival") != null && !"".equals(request.getParameter("arrival"))) {
						  cityString = request.getParameter("arrival");
					  }
					  if (request.getParameter("number") != null && !"".equals(request.getParameter("number"))) {
						  Sleeps = Integer.parseInt(request.getParameter("number"));
						  System.out.println("sleeps" + Sleeps);
					  }
					String Arrival = "%" + cityString + "%"; 
					%>
					<form id="searchhouse_form" class="searchhouse_form" action="../searching/searchhouse.jsp" method="get/post">
						<div class="search_input_city">
							<span>I'd like to stay in </span>
							<input type="text" name="arrival" placeholder="e.g. Paris, London" value="<%=cityString %>" >
						</div>
						<div class="search_input">
							<span>Check-in</span>
							<input type="date" name="indate">
						</div>
						<div class="search_input">
							<span>Check-out</span>
							<input type="date" name="outdate">
						</div>
						<div class="search_input">
							<span>Sleeping</span>
							<input type="number" name="number" <% if (Sleeps != 0) { %>value="<%=Sleeps %>"<%} %>>
						</div>
						<div class="submit_search">
							<input type="submit" name="submit" value="Search">
						</div>
					</form>
				</div>
				<div class="recommend_house">
				<%	String sql = "SELECT Hid, Uid, Title, Detail, Features, Style, bedrooms, bathrooms, PeoplNum, Addr_country, Addr_city, Address, Photo, Comment, State FROM house WHERE Addr_city LIKE ? AND PeoplNum >= ?;";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, Arrival);
					pstmt.setInt(2, Sleeps);
							rs = pstmt.executeQuery();
							while (rs.next()) { 
								String Hid = rs.getString(1);
								String Uid = rs.getString(2);
								String Title = rs.getString(3);
								String Detail = rs.getString(4);
								String Features = rs.getString(5);
								int Style = rs.getInt(6);
								int bedrooms = rs.getInt(7);
								int bathrooms = rs.getInt(8);
								int PeopleNum = rs.getInt(9);
								String Country = rs.getString(10);
								String City = rs.getString(11);
								String Address = rs.getString(12);
								String Photo = rs.getString(13);
								int Score = rs.getInt(14);
								int State = rs.getInt(15);
						%>
					<div class="recommandation">
						
						<a href="../myhouse/housedetail.jsp?Hid=<%=Hid %>" id="transHid">
						<div class="re_house">
							<div class="re_house_img">
							<img src="../img/house/1.jpg" width="300" height="220"></div>
							<div class="re_house_discribe"><%=Title %></div>
							<div class="re_house_discribe"><%=City %>, <%=Country %></div>
							<div class="re_house_discribe"><%=bedrooms %> bedrooms</div>
						<div class="re_house_comment">
						<% for (int i = 0; i < Score; i++) { %>
							❤
								
						<%} %>
							
					
						
						</div>
						</div></a>
						
					</div>
					<% } %>
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
		<div class="foot"> © Copyright 2020</div>
	</div>
	<%	} %>
</body>
</html>