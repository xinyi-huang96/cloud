package com.service;

import com.dao.UserDao;
import com.entity.User;

public class UserServiceImpl extends UserService{
	public int register(String email, String psw, String birth,int gender) {
        UserDao userDao = new UserDao();

        User user = new User();

        user.setEmail(email);
        user.setPsw(psw);
        user.setBirth(birth);
        user.setGender(gender);
        int info= userDao.adduser(user);
        return info;
    }
}
