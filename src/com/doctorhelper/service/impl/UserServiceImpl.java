package com.doctorhelper.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorhelper.dao.user.IUserDao;
import com.doctorhelper.entity.User;
import com.doctorhelper.service.IUserService;
    @Service
public class UserServiceImpl implements IUserService {
    @Autowired	
    private IUserDao<User> userdao;
    /*
     * 添加用户
     * @see com.doctorhelper.service.IUserService#addUser(com.doctorhelper.entity.User)
     */
	@Override
	public void addUser(User u) {
       userdao.save(u);
	}
	//根据openid查询用户
	@Override
	public User findUserByOpenId(String openId) {
		return userdao.findUserByOpenId(openId);
	}
	/*
	 * 保存或添加用户
	 * @see com.doctorhelper.service.IUserService#saveorupdateUser(com.doctorhelper.entity.User)
	 */
	@Override
	public void saveorupdateUser(User u) {
		userdao.saveorupdate(u);
	}
	/*
	 * 根据用户名和密码查询用户
	 * (non-Javadoc)
	 * @see com.doctorhelper.service.IUserService#findUserbynmAndpwd(java.lang.String, java.lang.String)
	 */
	@Override
	public User findUserbynmAndpwd(String name, String password) {
		String hql="from User u where u.loginname='"+name+"' and u.password='"+password+"'";
		User u=userdao.findUniqueUser(hql);
		return u;
	}

}
