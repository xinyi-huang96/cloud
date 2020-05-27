package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Order;
import com.util.Conn;

public class OrderDao {
	private Connection con = null;
	private PreparedStatement pst = null;
	
	public OrderDao() {
		con = Conn.getConnection();
	}
	
	public boolean addOrder(Order order) {
		try {
			PreparedStatement pst1 = con.prepareStatement("SELECT uid FROM house WHERE hid = ?;");
			pst1.setInt(1, Integer.parseInt(order.getHid()));
			ResultSet rs = pst1.executeQuery();
			if(rs.next()) {
				order.setOwner(Integer.toString(rs.getInt(1)));
				pst = con.prepareStatement("INSERT INTO order (Hid, Applicant, Owner, CheckIn, CheckOut, Comment)"
						+ " VALUES (?,?,?,?,?,?);");
				pst.setInt(1, Integer.parseInt(order.getHid()));
				pst.setInt(2, Integer.parseInt(order.getApplicant()));
				pst.setInt(3, rs.getInt(1));
				pst.setString(4, order.getCheckIn());
				pst.setString(5, order.getCheckOut());
				pst.setString(6, order.getComment());
				pst.executeUpdate();
				PreparedStatement pst2 = con.prepareStatement("SELECT oid FROM orderhouse WHERE hid = ? ORDER BY oid DESC;");
				pst2.setInt(1, Integer.parseInt(order.getHid()));
				ResultSet rs2 = pst2.executeQuery();
				if(rs2.next()) {
					order.setOid(Integer.toString(rs2.getInt(1)));
					order.setState(0);
					boolean flag = updateOrderState(order);
					if(flag) {
						return true;
					}else {
						return false;
					}
				}else {
					return false;
				}
			}else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateOrderState(Order order) {
		try {
			pst = con.prepareStatement("INSERT INTO orderreview VALUES (?,?,?,?);");
			pst.setInt(1, Integer.parseInt(order.getOid()));
			pst.setString(2, order.getOperTime());
			pst.setInt(3, order.getState());
			pst.setString(4, order.getOperComment());
			int row = pst.executeUpdate();
			if(row > 0) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
