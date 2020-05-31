package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//connect database
public class Conn {
	public static Connection getConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud", "root","root");
			System.out.println(conn.getMetaData().getURL());
			return conn;	
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void closeConnection(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void closePreparedStatement(PreparedStatement pst) {
		try {
			if (pst != null) {
				pst.close();
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
