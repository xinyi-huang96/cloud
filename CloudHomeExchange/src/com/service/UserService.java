package com.service;

import com.dao.UserDao;
import com.entity.User;

public class UserService {
	private UserDao userDao = new UserDao();
	
	//login
	public int login(User user) {
	    return userDao.valiUser(user);
	}

	//update user info
	public boolean update(User user) {
		return userDao.updateInfo(user);
	}
	
	//register
	public int register(User user) {
		return userDao.adduser(user);
	}
	
	//modify user password
	public boolean modifyPsw(User user) {
		return userDao.modifyPsw(user);	
	}
	
	//valid user password
	public boolean validPsw(User user) {
			return userDao.validPsw(user);	
	}
}
