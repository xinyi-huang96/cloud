package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.House;
import com.util.Conn;

public class HouseDao {
	private Connection con = null;
	private PreparedStatement pst = null;
	
	public HouseDao() {
		con = Conn.getConnection();
	}
	
	//add a new house
	public boolean addHouse(House house, String uid){
		try {
			pst = con.prepareStatement("INSERT INTO house (Uid, Title, Detail, Features, Style, bedrooms, bathrooms, "

				     + "PeoplNum,  Addr_country, Addr_city, Address, Photo, Comment, State) Values (?,?,?,?,?,?,?,?,?,?,?,?,?,?);");

			pst.setString(1, uid);
			pst.setString(2, house.getTitle());
			pst.setString(3, house.getDetail());
			pst.setString(4, house.getFeatures());
			pst.setInt(5, house.getStyle());
			pst.setInt(6, house.getBedrooms());
			pst.setInt(7, house.getBathrooms());
			pst.setInt(8, house.getPeopleNum());
			pst.setString(9, house.getCountry());
			pst.setString(10, house.getCity());
			pst.setString(11, house.getAddress());
			pst.setString(12, house.getPhoto());
			pst.setInt(13, 0);
			pst.setInt(14, 1);
			int row = pst.executeUpdate();
			if(row > 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	//edit a house
	public boolean editHouse(House house){
		try {
			pst = con.prepareStatement("UPDATE house SET Title = ?, Detail = ?, Features = ?, "
					+ " Style = ?, bedrooms = ?, bathrooms = ?, PeoplNum = ?,  Addr_country = ?,"
					+ " Addr_city = ?, Address = ?, Photo = ? WHERE Hid = ?;");
			pst.setString(1, house.getTitle());
			pst.setString(2, house.getDetail());
			pst.setString(3, house.getFeatures());
			pst.setInt(4, house.getStyle());
			pst.setInt(5, house.getBedrooms());
			pst.setInt(6, house.getBathrooms());
			pst.setInt(7, house.getPeopleNum());
			pst.setString(8, house.getCountry());
			pst.setString(9, house.getCity());
			pst.setString(10, house.getAddress());
			pst.setString(11, house.getPhoto());
			pst.setInt(12, Integer.parseInt(house.getHid()));
			int row = pst.executeUpdate();
			if(row > 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	//delete house
	public boolean deleteHouse(String hid){
		try {
			pst = con.prepareStatement("UPDATE house SET State = 0 WHERE Hid = ?;");

			pst.setString(1, hid);
			
			int row = pst.executeUpdate();
			if(row > 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public List<House> searchHouse(String where) {
		List<House> houseList = new ArrayList<House>();
		String sql = "SELECT Hid, Title, PeoplNum, Photo, AvgScore FROM house WHERE State = 1 " + where;
		try {
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				House house = new House();
				house.setHid(Integer.toString(rs.getInt("Hid")));
				house.setTitle(rs.getString("Title"));
				house.setPeopleNum(rs.getInt("PeoplNum"));
				house.setPhoto(rs.getString("Photo"));
				house.setComment(rs.getInt("Comment"));
				houseList.add(house);
				System.out.println("hid:" + house.getHid());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return houseList;
	}
	
	public int houseCount(String where) {
		String sql = "SELECT count(*) FROM house WHERE 1 = 1 " + where;
		try {
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				System.out.println("row:" + rs.getInt(1));
				return rs.getInt(1);
			}
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}
	
	//active house
		public boolean activeHouse(String hid){
			try {
				pst = con.prepareStatement("UPDATE house SET State = 1 WHERE Hid = ?;");

				pst.setString(1, hid);
				
				int row = pst.executeUpdate();
				if(row > 0)
					return true;
				else
					return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		
		//block house
		public boolean blockHouse(String hid){
			try {
				pst = con.prepareStatement("UPDATE house SET State = 0 WHERE Hid = ?;");

				pst.setString(1, hid);
				
				int row = pst.executeUpdate();
				if(row > 0)
					return true;
				else
					return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		
		//on advertise house
		public boolean advertiseHouse(String hid){
			try {
				pst = con.prepareStatement("UPDATE house SET State = 3 WHERE Hid = ?;");

				pst.setString(1, hid);
				
				int row = pst.executeUpdate();
				if(row > 0)
					return true;
				else
					return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		
		//off advertise house
		public boolean offAdvertiseHouse(String hid){
			try {
				pst = con.prepareStatement("UPDATE house SET State = 1 WHERE Hid = ?;");

				pst.setString(1, hid);
				
				int row = pst.executeUpdate();
				if(row > 0)
					return true;
				else
					return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
}
