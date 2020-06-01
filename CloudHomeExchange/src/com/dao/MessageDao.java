package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Message;
import com.util.Conn;

public class MessageDao {
	private Connection con = null;
	private PreparedStatement pst = null;
	
	public MessageDao() {
		con = Conn.getConnection();
	}
	
	public boolean sendMessage(Message msg) {
		try {
			pst = con.prepareStatement("INSERT INTO message (Sender, Receiver, Type, Content, SendTime) VALUES (?,?,?,?,?);");
			pst.setInt(1, Integer.parseInt(msg.getSender()));
			pst.setInt(2, Integer.parseInt(msg.getReceiver()));
			pst.setInt(3, msg.getType());
			pst.setString(4, msg.getContent());
			pst.setString(5, msg.getSendTime());
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
	
	public boolean readMessage(Message msg) {
		try {
			pst = con.prepareStatement("UPDATE message SET IsRead = 1 WHERE Mid = ?;");
			pst.setInt(1, Integer.parseInt(msg.getMid()));
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
	
	public List<Message> searchMessage(String uid) {
		try {
			pst = con.prepareStatement("SELECT * FROM message WHERE Receiver = ?;");
			pst.setInt(1, Integer.parseInt(uid));
			ResultSet rs = pst.executeQuery();
			List<Message> messageList = new ArrayList<Message>();
			while(rs.next()) {
				Message msg = new Message();
				msg.setMid(Integer.toString(rs.getInt("Mid")));
				msg.setMid(Integer.toString(rs.getInt("Sender")));
				msg.setMid(Integer.toString(rs.getInt("Receiver")));
				msg.setType(rs.getInt("Type"));
				msg.setIsRead(rs.getInt("IsRead"));
				msg.setContent(rs.getString("Content"));
				msg.setSendTime(rs.getString("SendTime"));
				messageList.add(msg);
			}
			return messageList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public int searchNotReadMessage(String uid) {
		try {
			pst = con.prepareStatement("SELECT COUNT(*) FROM message WHERE Receiver = ? AND IsRead = 0;");
			pst.setInt(1, Integer.parseInt(uid));
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}else
				return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
}
