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
				<a href="myaccount/login.html">Sign out</a>
			<%	} else { %>
				<a href="myaccount/login.html">Log in</a>
			<%	} %>
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
					<li><a href="advertisement.jsp">Advertisement</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="nav">
					<a href="user.jsp">house info</a>
				</div>
				<div class="info">		
				<form>	
					<table class="userInfo">
						<tr>
							<th>Hid</th>
							<th>Uid</th>
							<th>Title</th>
							<th>Detail</th>
							<th>Features</th>
							<th>Style</th>
							<th>bedrooms</th>
							<th>bathrooms</th>
							<th>PeopleNum</th>
							<th>Address</th>
							<th>Photo</th>
							<th>State</th>
							<th></th>
						</tr>
						<% 
							String sql = "SELECT * FROM house;";
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
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
								String Address = rs.getString(10);
								String Photo = rs.getString(11);
								int State = rs.getInt(12);
						%>
						<tr>
							<td><% out.print(Hid); %></td>
							<td><% out.print(Uid); %></td>
							<td><% out.print(Title); %></td>
							<td><% out.print(Detail); %></td>
							<td><% out.print(Features); %></td>
							<td><% out.print(Style); %></td>
							<td><% out.print(bedrooms); %></td>
							<td><% out.print(bathrooms); %></td>
							<td><% out.print(PeopleNum); %></td>
							<td><% out.print(Address); %></td>
							<td><% out.print(Photo); %></td>
							<td><% out.print(State); %></td>
							<input type="text" name="Uid" value="<%=Uid %>" hidden>
							<td><input type="submit" value="modify"></td>
						</tr>
						
						<%
							}
						%>
					</table>
					</form>	
				</div>
			</div>
		</div>
	</div>
<%			
	}		
%>
</body>
</html>