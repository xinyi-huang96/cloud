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
					<li class="active"><a href="apply.jsp">Apply</a></li>
					<li><a href="comment.jsp">Comment</a></li>
					<li><a href="message.jsp">Message</a></li>
					<li><a href="advertisement.jsp">Advertise</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="nav">
					<a>apply</a>
				</div>
				<div class="info">			
					<table class="userInfo">
						<tr>
							<th>Oid</th>
							<th>Hid</th>
							<th>Applicant</th>
							<th>CheckIn</th>
							<th>ChenkOut</th>
							<th>Comment</th>
							<th>OperTime</th>
							<th>State</th>
						</tr>
						<% 
						String sql = "SELECT h.Oid, h.Hid, h.Applicant, h.CheckIn, h.CheckOut, h.Comment, r.OperTime, r.State, r.OperComment, r.Oid" 
								+ " FROM orderhouse h JOIN ( SELECT t.OperTime, t.State, t.OperComment, t.Oid FROM ("
								+ " SELECT OperTime, State, OperComment, Oid FROM orderreview ORDER BY OperTime DESC )t"
								+ " GROUP BY t.Oid HAVING t.State < 2 ) r ON h.Oid = r.Oid ;";
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							while (rs.next()) { 
								int Oid = rs.getInt(1);
								int Hid = rs.getInt(2);
								String Applicant = rs.getString(3);
								String CheckIn = rs.getString(4);
								String ChenkOut = rs.getString(5);
								String Comment = rs.getString(6);
								String OperTime = rs.getString(7);
								int State = rs.getInt(8);
								
								String state = "";
								
								if (State == 0) {
									state = "unchecked";
								}
								if (State == 1) {
									state = "on going";
								}
								if (State == 2) {
									state = "cancelled";
								}
								if (State == 3) {
									state = "completed";
								}
								if (State == 4) {
									state = "wait comment";
								}
						%>
						<tr>
								<td><%=Oid %></td>
								<td><%=Hid %></td>
								<td><%=Applicant %></td>
								<td><%=CheckIn %></td>
								<td><%=ChenkOut %></td>
								<td><%=Comment %></td>
								<td><%=OperTime %></td>
								<td><%=state %></td>
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