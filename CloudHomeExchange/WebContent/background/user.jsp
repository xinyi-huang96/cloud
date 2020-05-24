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
					<li class="active"><a href="user.jsp">User</a></li>
					<li><a href="house.jsp">House</a></li>
					<li><a href="apply.jsp">Apply</a></li>
					<li><a href="comment.jsp">Comment</a></li>
					<li><a href="message.jsp">Message</a></li>
					<li><a href="advertisement.jsp">Advertisement</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="nav">
					<a href="user.jsp">user info</a>
				</div>
				<div class="info">			
					<table class="userInfo">
						<tr>
							<th>uid</th>
							<th>nickname</th>
							<th>gender</th>
							<th>birthday</th>
							<th>e-mail</th>
							<th>telephone</th>
							<th>State</th>
							<th></th>
						</tr>
						<% 
							String sql = "SELECT user.Uid, State, NickName, Gender, Age, user.Email, Telephone FROM user JOIN login ON user.Uid = login.Uid WHERE user.UserType = 0;";
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							while (rs.next()) { 
								int uid = rs.getInt(1);
								int State = rs.getInt(2);
								String state = null;
								if (State == 0)
									state = "block";
								if (State == 1)
									state = "active";
								if (State == 2)
									state = "deleted";
								String nickname = rs.getString(3);
								int genderNum = rs.getInt(4);
								String gender = null;
								if (genderNum == 0)
									gender = "Female";
								else
									gender = "Male";
								String birth = rs.getString(5);
								String email = rs.getString(6);
								int tel = rs.getInt(7);
						%>
						
						<tr>
							<form method="post">
								<input type="text" name="uid" value="<%=uid %>" hidden>
								<td><%=uid %></td>
								<td><%=nickname %></td>
								<td><%=gender %></td>
								<td><%=birth %></td>
								<td><%=email %></td>
								<td><%=tel %></td>
								<td><%=state %></td>
								<td>
								<% if (State != 2) {
								if (State == 0) {%>
									<input type="button" value="Active" onclick="form.action='ActiveUser';form.submit()">
								<% }if (State == 1) {%>
									<input type="button" value="Block" onclick="form.action='BlockUser';form.submit()">
								<% } %>
									<input type="button" value="Delete" onclick="form.action='DeleteUser';form.submit()">	
								<% } %>
								</td>
								</form>
						</tr>
						
						<% } %>
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