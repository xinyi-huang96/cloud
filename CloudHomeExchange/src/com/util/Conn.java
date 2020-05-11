package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

//connect database
public class Conn {
	public static Connection getConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud", "root","root");
			System.out.print(conn.getMetaData().getURL());
			return conn;	
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
