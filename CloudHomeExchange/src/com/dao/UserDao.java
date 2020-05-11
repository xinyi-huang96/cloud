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
			pst = con.prepareStatement("SELECT * FROM login WHERE uid = "
					+ "( SELECT uid FROM USER WHERE email = ? AND usertype = 0);");
			pst.setString(1, user.getEmail());
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				if(user.getPsw().equals(rs.getString("Password"))) {
					if(rs.getInt("State") == 0)	//if the account is blocked, return 3
						return 3;
					else if(rs.getInt("State") == 2)	//if the account is deleted, return -1
						return -1;
					else {	//if the account is active & password is right, return 4
						user.setUid(rs.getString("Uid"));
						return 4;
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
						PreparedStatement pst2 = con.prepareStatement("UPDATE login "
								+ "SET State = 0 WHERE uid = ?;");
						pst2.setString(1, rs.getString("Uid"));
						pst2.executeUpdate();
						return 3;
					}
				}
			}else {
				return -1;
			}
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
}