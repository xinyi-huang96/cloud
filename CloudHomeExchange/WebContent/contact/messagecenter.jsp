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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		setInterval(function() {
		  	$("#new").load(location.href+" #new>*","");
			}, 6000);
	</script>
	
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
					<li class="active"><a href="../contact/messagecenter.jsp">Message<span>▶</span></a></li>
				</ul>
			</div>
			<div class="main">
				
					<% String Uid = (String)session.getAttribute("userId"); %>
				<div class="message_center">
				<div class="mes_title">
					<div class="mes_tit">Message Center</div>
					<div class="center_switch"><a href="messagecenter_sended.jsp">OutBox</a></div>
					</div>
					<div class="messages" id="new">
					<%	
				String sql = "SELECT Nickname, Sender, Content, Mid FROM message Join user ON message.Sender = user.Uid WHERE Receiver = ? ORDER BY Mid DESC";
					pstmt = conn.prepareStatement(sql);
					String userId = (String)session.getAttribute("userId");
					pstmt.setString(1, userId);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						String Sendername = rs.getString(1);
						int Sender = rs.getInt(2);
						String Content = rs.getString(3);
						int Mid = rs.getInt(4);

				%>
					<div class="message">
						<div class="contacter">
						<div><%=Sendername %></div>
						</div>
						
						<div class="message_content">
						<a href="message.jsp?Mid=<%=Mid%>"><%=Content %></a>
						</div>
					</div>
				<% } %>
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
	<%} %>
</body>
</html>