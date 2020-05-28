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
	<link rel="stylesheet" href="../style/myhouse.css">
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
					<li class="active"><a href="../myhouse/index.jsp">My House<span>▶</span></a></li>
					<li ><a href="../myapply/index_applied.jsp">My Apply</a></li>
					<li><a href="../contact/send.jsp">Contact Us</a></li>
				</ul>
			</div>
			<div class="main">
				<div class="mytitle">
					<a href="addhouse.jsp"><button>add new house</button></a>
				</div>
			
			<%	
				String sql = "select Hid, Title, Detail, Address, Photo from house where Uid = ? AND State = 1;";
					pstmt = conn.prepareStatement(sql);
					String userId = (String)session.getAttribute("userId");
					pstmt.setString(1, userId);
					rs = pstmt.executeQuery();
					while (rs.next()) { 
						String Hid = rs.getString(1);
						String Title = rs.getString(2);
						String Detail = rs.getString(3);
						String Address = rs.getString(4);
						String Photo = rs.getString(5);
				%>
				
				<div class="myhouse">
					<a href="housedetail.jsp?Hid=<%=Hid %>" id="transHid">
					<div class="house_img">
						<img src="../img/house1.jpg">
					</div>
					</a>
					<div class="house_detail">
						<div class="house_info">
							<div class="house_location">
								<p>Paris, France</p>
							</div>
							<div class="house_contact">
								<div class="house_contact_loc">Address: <%=Address %></div>
								<div class="house_contact_mail">Title: <%=Title %></div>
								<div class="house_contact_tel">Detail: <%=Detail %></div>
							</div>
						</div>
						<div class="house_apply">
							<a href="../myhouse/edithouse.jsp?Hid=<%=Hid %>"><button>Edit</button></a>
							<!-- <form method="post" action="../deleteHouse"> -->
							<input type="text" name="hid" value="<%=Hid %>" hidden/>
							<!--<input type="submit" name="submit" value="delete">  -->
							<button onClick="confirmDel(<%=Hid %>)">Delete</button>
							
<script type="text/javascript">  
function confirmDel(hid)
{
         if(window.confirm("Are you sure to delete this house？")){
        	 window.location.href="../deleteHouse?hid="+hid;
        	 }
 }  
</script> 

						</div>
					</div>
				</div>
			<% } %>
			</div>
		</div>
		<div class="footer">
			<div class="footer_logo">
				<img src="../img/cloud.png">
			</div>
			<div class="footer_nav">
				<ul>
					<li><a href="#">About</a></li>
					<li><a href="#">About us</a></li>
				</ul>
			</div>
			<div class="social_media">
				<i class="fab fa-twitter fa-2x"></i>
				<i class="fab fa-instagram fa-2x"></i>
				<i class="fab fa-facebook-square fa-2x"></i>
			</div>
		</div>
		<div class="foot"> © Copyright 2020</div>
	</div>
<%	} %>
</body>
</html>