package com.doctorhelper.service;

import java.util.List;

import com.doctorhelper.entity.User;

public interface IUserService {
void addUser(User u);
User findUserByOpenId(String openId);
void saveorupdateUser(User u);
User findUserbynmAndpwd(String name,String password);
User findUserInfo(Long id);
User findUserByname(String name);
List<User> queryallByrole(int pagenum,int size,String rolecode);
Long querycountByrole(String rolecode);
List<User> queryuncheckedUser();
void updateUserChecksta(Long id,String checked);
void updateUserpwd(Long id,String newpwd);
}
