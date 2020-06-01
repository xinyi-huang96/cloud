package com.service;

import java.util.List;

import com.dao.MessageDao;
import com.entity.Message;

public class MessageService {
	private MessageDao messageDao = new MessageDao();
	
	public boolean sendMessage(Message msg) {
		return messageDao.sendMessage(msg);
	}
	
	public boolean readMessage(Message msg) {
		return messageDao.readMessage(msg);
	}

	public List<Message> searchMessage(String uid) {
		return messageDao.searchMessage(uid);
	}
	
	public int searchNotReadMessage(String uid) {
		return messageDao.searchNotReadMessage(uid);
	}
}
