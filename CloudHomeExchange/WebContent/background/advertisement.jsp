<%@page import="com.util.Conn"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Comatible" content="ie-edge">
	<title>Management - Cloud Home Exchange</title>
	<link rel="stylesheet" href="../style-background/commun.css">
	<link rel="stylesheet" href="../style-background/user.css">
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
</head>
<body>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	Conn DBConn = new Conn();
	conn = DBConn.getConnection();
	if(conn != null){
%>
	<div class="border_box">
		<div class="header">
			<div class="logo"><img src="../img/logo.png"></div>
			<div class="title">Welcome</div>
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
					<li><a href="../index-background.jsp">Home</a></li>
					<li><a href="user.jsp">User</a></li>
					<li><a href="house.jsp">House</a></li>
					<li><a href="apply.jsp">Apply</a></li>
					<li><a href="comment.jsp">Comment</a></li>
					<li><a href="message.jsp">Message</a></li>
					<li class="active"><a href="advertisement.jsp">Advertise</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="nav">
					<a>Advertise</a>
				</div>
				<div class="info">			
					<table class="userInfo">
						<tr>
							<th>Hid</th>
							<th>Uid</th>
							<th>Title</th>
							<th>Detail</th>
							<th>Features</th>
							<th>Style</th>
							<th>Comment</th>
							<th>State</th>
							<th></th>
						</tr>
						<% 
							String sql = "SELECT * FROM house WHERE State = 1 or State = 3;";
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							while (rs.next()) { 
								int Hid = rs.getInt(1);
								int Uid = rs.getInt(2);
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
								int Comment = rs.getInt(14);
								int State = rs.getInt(15);
								
								String style = "";
								if (Style == 1) {
									style = "City pad";
								} 
								if (Style == 2) {
									style = "By the sea";
								} 
								if (Style == 3) {
									style = "Countryside";
								} 
								if (Style == 4) {
									style = "Mountain";
								} 
								if (Style == 5) {
									style = "Spring water";
								} 
								
								String state = "";
								if (State == 1) {
									state = "on shelf";
								} 
								if (State == 3) {
									state = "on advertisement";
								} 
	
						%>
						
						<tr><form method="post">	
						<input type="text" name="hid" value="<%=Hid %>" hidden>
							<td><%=Hid %></td>
							<td><%=Uid %></td>
							<td><%=Title %></td>
							<td><%=Detail%></td>
							<td><%=Features %></td>
							
							<td><%=style %></td>
							
							<td><%=Comment %></td>
							<td><%=state %></td>
							
							<td><%if(State == 1){ %><input type="button" value="On Advertise" onclick="form.action='../OnAdvertise';form.submit()"><% } %>
								<%if(State == 3){ %><input type="button" value="Off Advertise" onclick="form.action='../OffAdvertise';form.submit()"><% } %>
		
							</td></form>	
						</tr>
						
						
						<%
							}
						%>
						
					</table>
				</div>
			</div>
		</div>
	</div>
<%			
	}		
%>
</body>
</html>