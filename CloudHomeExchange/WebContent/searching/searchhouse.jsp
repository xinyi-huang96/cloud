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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://secure.geobytes.com/AutoCompleteCity?key=7c756203dbb38590a66e01a5a3e1ad96&callback=?"></script>
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
					<li  class="active"><a href="../searching/searchhouse.jsp">Search House<span>▶</span></a></li>
					<li><a href="../myaccount/myprofile.jsp">My Account</a></li>
					<li><a href="../myhouse/index.jsp">My House</a></li>
					<li><a href="../myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="../contact/messagecenter.jsp">Message</a></li>
				</ul>
			</div>
			<div class="mainsearch">
				<div class="search">
					<%		
						String cityString = "";
						StringBuffer sb = new StringBuffer(1024);
						
					  if (request.getParameter("arrival") != null && !"".equals(request.getParameter("arrival"))) {
						  cityString = request.getParameter("arrival");
						  sb.append(" AND Addr_city like '%" + cityString + "%'");
					  }
					  //String Arrival = "%" + cityString + "%"; 
					  
					  String checkIn = "";
					  String checkOut = "";
					  if (request.getParameter("indate") != null && !"".equals(request.getParameter("indate"))) {
						  checkIn = request.getParameter("indate");
						  sb.append(" AND Hid NOT IN ( " + 
									"	SELECT Hid FROM orderhouse " + 
									"	WHERE checkin <= " +  checkIn +
									"	AND checkout > " + checkIn + ")");
					  }
					  if (request.getParameter("outdate") != null && !"".equals(request.getParameter("outdate"))) {
						  checkOut = request.getParameter("outdate");
						  sb.append(" AND Hid NOT IN ( " + 
									"	SELECT Hid FROM orderhouse " + 
									"	WHERE checkin <= " +  checkIn +
									"	AND checkout > " + checkOut + ")");
					  }

					  
					  int Sleeps = 0;
						
					  if (request.getParameter("sleeps") != null && !"".equals(request.getParameter("bedrooms"))) {
						  Sleeps = Integer.parseInt(request.getParameter("sleeps"));
						  sb.append(" AND PeoplNum >= " + Sleeps + " ");
					  }
					  
					  int Bedrooms = 0;
					  if (request.getParameter("bedrooms") != null && !"".equals(request.getParameter("bedrooms"))) {
						  Bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
						  sb.append(" AND bedrooms >= " + Bedrooms + " ");
					  }
					  
					  String st = "";
						
						
					  if (request.getParameter("style") != null && !"".equals(request.getParameter("style"))) {
						  st = request.getParameter("style");
						  sb.append(" AND style = ");
						  if(st.equals("CityPad")) {
							  sb.append("1 ");
						  }if(st.equals("ByTheSea")) {
							  sb.append("2 ");
						  }if(st.equals("Countryside")) {
							  sb.append("3 ");
						  }if(st.equals("Mountain")) {
							  sb.append("4 ");
						  }if(st.equals("SpringWater")) {
							  sb.append("5 ");
						  }
					  }
					  
					  
						boolean[] flag = {false, false, false, false, false};		
						if(request.getParameter("feature") != null && !"".equals(request.getParameter("feature"))) {
							String[] feature = request.getParameterValues("feature");
							StringBuffer sbu = new StringBuffer(1024);
							for(String fea:feature){
								System.out.println(fea);
								sbu.append(fea + "|");
							} 
							String features = sbu.toString();
							sb.append("features REGEXP " + features.substring(0, features.length() - 1));
							 if(features.contains("Wifi"))
								 flag[0] = true;
							 if(features.contains("TV"))
								 flag[1] = true;
							 if(features.contains("NoSmoking"))
								 flag[2] = true;
							 if(features.contains("Kid"))
								 flag[3] = true;
							 if(features.contains("Washing"))
								 flag[4] = true;
						}  
									

					%>
					<form id="searchhouse_form" class="searchhouse_form" action="../searching/searchhouse.jsp" method="get/post">
						<div class="search_input_1">
						<div class="search_input_city">
							<span>I'd like to stay in </span>
							<input type="text" name="arrival" placeholder="e.g. Paris, London" value="<%=cityString %>" required>
						</div>
						<div class="search_input_date">
							<span>Check-in</span>
							<input type="date" name="indate" value="<%=checkIn %>">
						</div>
						<div class="search_input_date">
							<span>Check-out</span>
							<input type="date" name="outdate" value="<%=checkOut %>">
						</div>
						<div class="search_input_number">
							<span>Sleeping</span>
							<select name="sleeps">
								<option value="0" <%if(Sleeps == 0){ %>selected<% } %>>0</option>
								<option value="1" <%if(Sleeps == 1){ %>selected<% } %>>1</option>
								<option value="2" <%if(Sleeps == 2){ %>selected<% } %>>2</option>
								<option value="3" <%if(Sleeps == 3){ %>selected<% } %>>3</option>
								<option value="4" <%if(Sleeps == 4){ %>selected<% } %>>4</option>
								<option value="5" <%if(Sleeps == 5){ %>selected<% } %>>5</option>
								<option value="6" <%if(Sleeps == 6){ %>selected<% } %>>6</option>
								<option value="7" <%if(Sleeps == 7){ %>selected<% } %>>7</option>
								<option value="8" <%if(Sleeps == 8){ %>selected<% } %>>8 or more</option>
							</select>
						</div>
						<div class="search_input_number">
							<span>Bedrooms</span>
							<select name="bedrooms">
								<option value="0" <%if(Bedrooms == 0){ %>selected<% } %>>0</option>
								<option value="1" <%if(Bedrooms == 1){ %>selected<% } %>>1</option>
								<option value="2" <%if(Bedrooms == 2){ %>selected<% } %>>2</option>
								<option value="3" <%if(Bedrooms == 3){ %>selected<% } %>>3</option>
								<option value="4" <%if(Bedrooms == 4){ %>selected<% } %>>4</option>
								<option value="5" <%if(Bedrooms == 5){ %>selected<% } %>>5 or more</option>
							</select>
						</div>
						</div>
						<div class="search_input_2">
						<div class="search_input_style">
							<div class="tit"><span>House Style</span></div>
							<div class="choose_1">
							<div class="input_style">
									<input type="radio" name="style" value="CityPad" <% if(st.equals("CityPad")) { %> checked<% } %>>City pad
								</div>
								<div class="input_style">
									<input type="radio" name="style" value="ByTheSea" <% if(st.equals("ByTheSea")) { %> checked<% } %>>By the sea
								</div>
								<div class="input_style">
									<input type="radio" name="style" value="Countryside" <% if(st.equals("Countryside")) { %> checked<% } %>>Countryside
								</div>
								<div class="input_style">
									<input type="radio" name="style" value="Mountain" <% if(st.equals("Mountain")) { %> checked<% } %>>Mountain
								</div>
								<div class="input_style">
									<input type="radio" name="style" value="SpringWater" <% if(st.equals("SpringWater")) { %> checked<% } %>>Spring water
								</div>
								</div>
						</div>
						</div>
						 <div class="search_input_3">
						<div class="search_input_feature">
							<div class="tit"><span>Feature</span></div>
							<div class="choose_2">
							<div class="input_feature">
									<input  class="magic-checkbox" type="checkbox" name="layout" id="c1" value="Wifi"<% if(flag[0] == true) { %> checked<% } %>>
									<label for="c1">Wifi</label>
								</div>
								<div class="input_feature">
									<input class="magic-checkbox" type="checkbox" name="layout" id="c2" value="TV"<% if(flag[1] == true) { %> checked<% } %>>
									<label for="c2">TV</label>
								</div>
								<div class="input_feature">
									<input class="magic-checkbox" type="checkbox" name="layout" id="c3" value="NoSmoking"<% if(flag[2] == true) { %> checked<% } %>>
									<label for="c3">NO smoking</label>
								</div>
								<div class="input_feature">
									<input class="magic-checkbox" type="checkbox" name="layout" id="c4" value="Kid"<% if(flag[3] == true) { %> checked<% } %>>
									<label for="c4">For kid</label>
								</div>
								<div class="input_feature">
									<input class="magic-checkbox" type="checkbox" name="layout" id="c5" value="Washing"<% if(flag[4] == true) { %> checked<% } %>>
									<label for="c5">Washing</label>
								</div>
								</div>
						</div>
						</div>
						<div class="search_input_4">
						<div class="search_submit">
							<input type="submit" name="submit" value="Search">
						</div>
						</div>
					</form>
				</div>
				<div class="recommend_house">
				<%	String sql = "SELECT Hid, Uid, Title, Detail, Features, Style, bedrooms, bathrooms, PeoplNum, Addr_country, Addr_city, Address, Photo, Comment, State FROM house WHERE State = 1"
								+ sb.toString();
					pstmt = conn.prepareStatement(sql);
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
					
						
						
						<div class="recommandation"><a href="../myhouse/housedetail.jsp?Hid=<%=Hid %>" id="transHid">
							<div class="re_house_img">
								<img src="../img/house1.jpg" width="300" height="220">
							</div>
							<div class="re_house_detail">
							<div class="re_house_title""><%=Title %></div>
							<div class="re_house_loc"><%=City %>, <%=Country %></div>
							<div class="re_house_bed"><%=bedrooms %> bedrooms</div>
							<div class="re_house_comment">
						<% for (int i = 0; i < Score; i++) { %>
							❤
								
						<%} %>
							
					
						</div>
							</div></a>
						
							<div class="re_house_link">
							<a href="../myhouse/housedetail.jsp?Hid=<%=Hid %>"><button>More details</button></a>
							</div>
						</div>
					
					<% } %>
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