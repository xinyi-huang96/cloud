package model;

import java.sql.*;

public class DBConnect {
	
	public Connection conn = null;
	
	public void connectDB() {
			
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/cloud";
			String username = "root";
			String password = "root";
			conn = DriverManager.getConnection(url, username, password);}
		catch (Exception e) {		
				e.printStackTrace();
		}
	}
}
