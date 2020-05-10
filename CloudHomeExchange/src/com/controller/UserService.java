package com.controller;

import com.model.User;

public class UserService {
	public int login(User user) {
	    return new UserDao().valiUser(user);
	}

}
