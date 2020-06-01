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
	<link rel="stylesheet" href="../style/myapply.css">
	<link rel="stylesheet" href="../style/common.css">
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/f3dde35be0.js" crossorigin="anonymous"></script>
</head>
<body>
<%	Connection conn = null;
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
					<li><a href="../myaccount/myprofile.jsp">My Account</a></li>
					<li><a href="../myhouse/index.jsp">My House</a></li>
					<li class="active"><a href="../myapply/index_applied.jsp">My Apply<span>▶</span></a></li>
					<li><a href="../contact/messagecenter.jsp">Message</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="apply_index">
					<ul>
						<li><a href="index_applied.jsp">Applied</a></li>
						<li><a href="index_received.jsp">Received</a></li>
						<li><a class="active" href="index_history.jsp">History</a></li>
					</ul>
				</div>
				<%	
					String sql = "SELECT h.Hid, h.Owner, h.CheckIn, h.CheckOut, h.Comment, r.OperTime, r.State, r.OperComment, r.Oid" 
							+ " FROM orderhouse h JOIN ( SELECT t.OperTime, t.State, t.OperComment, t.Oid FROM ("
							+ " SELECT OperTime, State, OperComment, Oid FROM orderreview ORDER BY OperTime DESC )t"
							+ " GROUP BY t.Oid HAVING t.State > 1 ) r ON h.Oid = r.Oid WHERE h.Applicant = ? OR h.Owner = ?;";	
					pstmt = conn.prepareStatement(sql);
					String userId = (String)session.getAttribute("userId");
					int uidInt = Integer.parseInt(userId);
					pstmt.setString(1, userId);
					pstmt.setString(2, userId);
					rs = pstmt.executeQuery();
					while (rs.next()) { 
						int Hid = rs.getInt(1);
						String CheckIn = rs.getString(3);
						String CheckOut = rs.getString(4);
						String Comment = rs.getString(5);
						String OperTime = rs.getString(6);
						int State = rs.getInt(7);
						String state = "";
						String stateColor = "";
						String stateWidth = "";
						if (State == 0) {
							state = "unchecked";
							stateColor = "#b9ddee";
							stateWidth = "33%";
						}
							
						if (State == 1) {
							state = "checked";
							stateColor = "#0e81cb";
							stateWidth = "66%";
						}
							
						if (State == 2) {
							state = "cancelled";
							stateColor = "grey";
							stateWidth = "100%";
						}
							
						
						if (State == 3) {
							state = "wait for comment";
							stateColor = "lightskyblue";
							stateWidth = "98%";
						}
						
						if (State == 4) {
							state = "completed";
							stateColor = "lightskyblue";
							stateWidth = "100%";
						}
							
						
						
						
						String OperComment = rs.getString(8);
						int Oid = rs.getInt(9);
						PreparedStatement pstmt1 = null;
						ResultSet rs1 = null;
						String sql1 = "SELECT Uid, Title, Addr_country, Addr_city, Address, Photo FROM house WHERE Hid = ?";
						pstmt1 = conn.prepareStatement(sql1);
						String hidString = Integer.toString(Hid);
						pstmt1.setString(1, hidString);
						rs1 = pstmt1.executeQuery();
						
						int Uid = 0;
						String Title = "";
						String City = "";
						String Country = "";
						String Address = "";
						String Photo = "";
						
						while (rs1.next()) { 
							Uid = rs1.getInt(1);
							Title = rs1.getString(2);
							Country = rs1.getString(3);
							City = rs1.getString(4);
							Address = rs1.getString(5);
							Photo = rs1.getString(6);
						}
						
						
				%>
				<div class="myapply" <% if(uidInt == Uid){ %> style="background-color: #F7F7F7;"<% } %>>
					<div class="apply_title">
						<div class="apply_time">Order Time: <%=OperTime %></div>
						<div class="apply_id">Order Id: <%=Oid+123456789 %></div>
						<div class="apply_mes">
						<% if(uidInt == Uid){ %><div style="color: grey; padding-right: 50px;">Your order</div><% } %>
						<% if(State == 3 && uidInt != Uid){ %>
						<a href="comment.jsp?Oid=<%=Oid %>"><button>Comment</button></a>
						<% } %></div>
					</div>
					<div class="apply_info">
						<a href="../myhouse/housedetail.jsp?Hid=<%=Hid %>">
						<div class="house_img">
							<img src="../img/house1.jpg">
						</div>
						<div class="house_info">
							<div class="house_title"><%=Title %></div>
							<div class="house_loc"><%=City %>, <%=Country %></div>
						</div>
						</a>
						<div class="apply_detail">
							<div class="apply_detail_1">
								<div class="apply_status">State: <%=state %></div>
								<div class="apply_status_bar">
									<div class="progress-bar">
										<div class="progress" style="width:<%=stateWidth %>; background-color: <%=stateColor %>;"></div>
									</div>
								</div>
							</div>
							
							<div class="apply_detail_2">
								<div class="apply_date"><%=CheckIn %> - <%=CheckOut %></div>
								<div class="apply_comment">Comment: <%=OperComment %></div>
							</div>
							
						</div>
						
					</div>
				</div>
				<% } %>
				<div class="blank"></div>
				
				
			</div>
		</div>
		<div class="footer">
			<div class="footer_logo">
				<img src="../img/cloud.png">
			</div>
			<div class="footer_nav">
				<ul>
					<li><a href="../contact/send.jsp">Contact us</a></li>
					<li><a href="../contact/about.jsp">About us</a></li>
				</ul>
			</div>
			<div class="social_media">
				<i class="fab fa-twitter fa-2x"></i>
				<i class="fab fa-instagram fa-2x"></i>
				<i class="fab fa-facebook-square fa-2x"></i>
			</div>
		</div>
		<div class="foot">Â© Copyright 2020</div>
	</div>
		<%	} %>
</body>
</html>