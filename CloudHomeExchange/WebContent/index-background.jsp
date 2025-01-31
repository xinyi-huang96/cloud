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
	<title>Management - Cloud Home Exchange</title>
	<link rel="stylesheet" href="style-background/commun.css">
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
			<div class="logo"><img src="img/logo.png"></div>
			<div class="title">Welcome</div>
			<div class="login">
				<%	if (session.getAttribute("userNickName") != null) {
			%>
				<a>Welcome, <%=session.getAttribute("userNickName") %></a>
				<a href="myaccount/login.jsp">Sign out</a>
			<%	} else { %>
				<a href="myaccount/login.jsp">Log in</a>
			<%	} %>
			</div>
		</div>
		<div class="main_box">
			<div class="left_nav">
				<ul>
					<li class="active"><a href="index-background.jsp">Home</a></li>
					<li ><a href="background/user.jsp">User</a></li>
					<li><a href="background/house.jsp">House</a></li>
					<li><a href="background/apply.jsp">Apply</a></li>
					<li><a href="background/comment.jsp">Comment</a></li>
					<li><a href="background/message.jsp">Message</a></li>
					<li><a href="background/advertisement.jsp">Advertisement</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="welcome" style="font-size: 30px;">
					welcome
				</div>
			</div>
		</div>
	</div>
	<%			
	}		
%>
</body>
</html>