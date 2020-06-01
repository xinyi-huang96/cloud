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
	<title>Cloud Home Exchange</title>
	<link rel="stylesheet" href="../style/contact.css">
	<link rel="stylesheet" href="../style/common.css">
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
</head>
<body>
<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
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
					<li ><a href="../myaccount/myprofile.jsp">My Account</a></li>
					<li><a href="../myhouse/index.jsp">My House</a></li>
					<li><a href="../myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="../contact/messagecenter.jsp">Message</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="message_center">
					
				<% String Uid = (String)session.getAttribute("userId"); 
				String Mid = request.getParameter("Mid");%>
				<%	
				String sql = "SELECT Nickname, Sender, Content FROM message Join user ON message.Sender = user.Uid WHERE Mid = ?";
					pstmt = conn.prepareStatement(sql);
					String userId = (String)session.getAttribute("userId");
					pstmt.setString(1, Mid);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						String Sendername = rs.getString(1);
						int Sender = rs.getInt(2);
						String Content = rs.getString(3);

				%>
				<div class="mes_title">Message With <%=Sendername %></div>
					<div class="contact">
						<div class="content_receive">
							<div class="sender"><%=Sendername %></div>
							<div class="content"><%=Content %></div>
						
						</div>
						
						
	
					</div>
					<% } %>
					<div class="message_input1">
					<form method="post" action="">
						<input type="text" name="receiver" value="" hidden>
						<div class="inputform1">
							<textarea maxlength="1000" name="content" required></textarea>
						</div>
						<div class="inputsubmit1"><input type="submit" value="SEND"></div>
						
					</form>
					</div>
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
		<div class="foot"><span>© Copyright 2020</span></div>
	</div>
	<% } %>
</body>
</html>