package com.service;

import com.dao.UserDao;
import com.entity.User;

public class UserServiceImpl extends UserService{
	public boolean register(String email, String psw, String birth,int gender) {
        UserDao userDao = new UserDao();

        User user = new User();

        user.setEmail(email);
        user.setPsw(psw);
        user.setBirth(birth);
        user.setGender(gender);
        boolean info= userDao.adduser(user);
        return info;
    }
}
