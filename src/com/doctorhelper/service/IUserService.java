package com.doctorhelper.service;

import com.doctorhelper.entity.User;

public interface IUserService {
void addUser(User u);
User findUserByOpenId(String openId);
void saveorupdateUser(User u);
User findUserbynmAndpwd(String name,String password);
}
