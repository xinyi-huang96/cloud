package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;
import com.util.Conn;

public class UserDao {
	private Connection con = null;
	private PreparedStatement pst = null;
	
	public UserDao() {
		con = Conn.getConnection();
	}
	
	//valid the username and password
	public int valiUser(User user){
		try{
			pst = con.prepareStatement("SELECT * FROM login WHERE email = ? ;");
			pst.setString(1, user.getEmail());
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				if(user.getPsw().equals(rs.getString("Password"))) {
					if(rs.getInt("State") == 0)	//if the account is blocked, return 3
						return 3;
					else if(rs.getInt("State") == 2)	//if the account is deleted, return -1
						return -1;
					else {	//if the account is active & password is right, return 4
						user.setEmail(rs.getString("email"));
						user.setPsw(rs.getString("Password"));
						if(searchUser(user)) {
							return 4;
						}else {
							return -1;
						}
					}
				}else {
					int num = rs.getInt("ErrorTimes") + 1;
					PreparedStatement pst1 = con.prepareStatement("UPDATE login "
							+ "SET ErrorTimes = ? WHERE uid = ?;");
					pst1.setInt(1, num);
					pst1.setString(2, rs.getString("Uid"));
					pst1.executeUpdate();
					if(num < 3)
						return (3-num);
					else {
						//if input wrong password for 3 times, lock the account
						PreparedStatement pst2 = con.prepareStatement("UPDATE login "
								+ "SET State = 0 WHERE uid = ?;");
						pst2.setString(1, rs.getString("Uid"));
						pst2.executeUpdate();
						return 3;
					}
				}
			}
			return -1;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	//update user information
	public boolean updateInfo(User user) {
		try {
			pst = con.prepareStatement("UPDATE user SET nickname = ?, gender = ?, "
					+ "birth = ?, email = ?, telephone = ? WHERE uid = ?;");
			pst.setString(1, user.getNickName());
			pst.setInt(2, user.getGender());
			pst.setString(3, user.getBirth());
			pst.setString(4, user.getEmail());
			pst.setInt(5, user.getTelephone());
			pst.setString(6, user.getUid());
			pst.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//register add a user
	public int adduser(User user) {
		try {
			PreparedStatement pst1 = con.prepareStatement("INSERT INTO user (email,age,gender) VALUES (?,?,?);");
			
			pst1.setString(1, user.getEmail());
			pst1.setString(2, user.getBirth());
			pst1.setInt(3, user.getGender());
			pst = con.prepareStatement("SELECT * FROM user WHERE email = ? ;");
			pst.setString(1, user.getEmail());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				user.setEmail(rs.getString("email"));
				if (searchUser(user)) {
					return 0;//user existed
				}
			}
			pst1.executeUpdate();
			
			PreparedStatement pst0 = con.prepareStatement("SELECT uid FROM user WHERE email = ? ;");
			pst0.setString(1, user.getEmail());
			ResultSet result = pst.executeQuery();
			result.next();
			int uid = result.getInt("uid");
			System.out.println(uid);
			PreparedStatement pst2 = con.prepareStatement("INSERT INTO login (uid,email,password) VALUES (?,?,?);");
			pst2.setInt(1, result.getInt("uid"));
			pst2.setString(2, user.getEmail());
			pst2.setString(3, user.getPsw());
			pst2.executeUpdate();
			String userid = String.valueOf(uid);
			user.setUid(userid);
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return 2;
		}
	}
	
	public boolean searchUser(User user) {
		try {
			PreparedStatement pst1 = con.prepareStatement("SELECT * FROM user WHERE email = ?;");
			pst1.setString(1, user.getEmail());
			ResultSet rs = pst1.executeQuery();
			if(rs.next()) {
				user.setNickName(rs.getString("NickName"));
				user.setGender(rs.getInt("Gender"));
				user.setBirth(rs.getString("Age"));
				user.setEmail(rs.getString("Email"));
				user.setTelephone(rs.getInt("Telephone"));
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
