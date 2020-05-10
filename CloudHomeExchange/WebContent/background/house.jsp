<%@page import="model.DBConnect"%>
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
	<link rel="stylesheet" href="../style-background/main.css">
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
</head>
<body>
<%
	Statement stmt = null;
	ResultSet rs = null;
	DBConnect conn = new DBConnect();
	conn.connectDB();
	if(conn.conn != null){
%>
	<div class="border_box">
		<div class="header">
			<div class="logo"><img src="../img/cloud.png"></div>
			<div class="title">Welcome</div>
			<div class="login">
				<a href="#">username</a>
				<a href="#">sign out</a>
			</div>
		</div>
		<div class="main_box">
			<div class="left_nav">
				<ul>
					<li><a href="../index-background.html">Home</a></li>
					<li><a href="user.jsp">User</a></li>
					<li class="active"><a href="house.jsp">House</a></li>
					<li><a href="apply.jsp">Apply</a></li>
					<li><a href="comment.jsp">Comment</a></li>
					<li><a href="message.jsp">Message</a></li>
					<li><a href="advertive.jsp">Advertice</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="nav">
					<a href="#" class="active">house info</a>
				</div>
				<div class="info">
					<table class="userInfo">
						<tr>
							<th>uid</th>
							<th>nickname</th>
							<th>usertype</th>
							<th>gender</th>
							<th>age</th>
							<th>email</th>
							<th>telephone</th>
							<th></th>
						</tr>
						<% 
							String sql = "SELECT * FROM user;";
							stmt = conn.conn.createStatement();
							rs = stmt.executeQuery(sql);
							while (rs.next()) { 
								String uid = rs.getString(1);
								String nickname = rs.getString(2);
								int usertype = rs.getInt(3);
								int gender = rs.getInt(4);
								int age = rs.getInt(5);
								String email = rs.getString(6);
								int telephone = rs.getInt(7);
						%>
						<tr>
							<td><% out.print(uid); %></td>
							<td><% out.print(nickname); %></td>
							<td><% out.print(usertype); %></td>
							<td><% out.print(gender); %></td>
							<td><% out.print(age); %></td>
							<td><% out.print(email); %></td>
							<td><% out.print(telephone); %></td>
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