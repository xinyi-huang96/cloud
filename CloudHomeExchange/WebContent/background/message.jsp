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
					<li class="active"><a href="message.jsp">Message</a></li>
					<li><a href="advertisement.jsp">Advertise</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="nav">
					<a href="user.jsp">Message</a>
				</div>
				<div class="info">			
					<table class="userInfo">
						<tr>
							<th>Mid</th>
							<th>Sender</th>
							<th>Receiver</th>
							<th>Content</th>
							<th>SendTime</th>
						</tr>
						<% 
							String sql = "SELECT * FROM message ORDER BY Mid DESC;";
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							while (rs.next()) { 
								String Mid = rs.getString(1);
								String Sender = rs.getString(2);
								String Receiver = rs.getString(3);
								String Type = rs.getString(4);
								String IsRead = rs.getString(5);
								String Content = rs.getString(6);
								String SendTime = rs.getString(7);
								
						%>
						<tr>
							<td><%=Mid %></td>
							<td><%=Sender %></td>
							<td><%=Receiver %></td>
							<td><%=Content %></td>
							<td><%=SendTime %></td>
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