package com.controller;

import com.model.User;

public class UserService {
	private UserDao userDao = new UserDao();
	
	public int login(User user) {
	    return userDao.valiUser(user);
	}

	public boolean update(User user) {
		return userDao.updateInfo(user);
	}
}
