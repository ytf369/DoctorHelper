package com.doctorhelper.service.impl;

import java.util.List;

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
	/**
	 * 查询用户个人信息
	 */
	@Override
	public User findUserInfo(Long id) {
		return userdao.findById(User.class,id);
	}
	/**
	 * 根据用户名查询用户
	 */
	@Override
	public User findUserByname(String name) {
		String hql="from User u where u.loginname='"+name+"'";
		return userdao.findUniqueUser(hql);
	}
	/**
	 * 查询没有审核通过的专家医生
	 */
	@Override
	public List<User> queryuncheckedUser() {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 根据角色查询所有用户
	 */
	@Override
	public List<User> queryallByrole(int pagenum,int size,String rolecode) {
		String hql="from User u where u.role='"+rolecode+"'";
		return userdao.querylistWithPage(hql, pagenum, size);
	}
	/**
	 * 根据角色查询用户数量
	 */
	@Override
	public Long querycountByrole(String rolecode) {
		String hql="select count(id) from User u where u.role='"+rolecode+"'";
		return userdao.querylistCount(hql);
	}
	/**
	 * 更新用户的审核状态
	 */
	@Override
	public void updateUserChecksta(Long id,String checked) {
		String hql="update User u set u.chicked="+checked+" where u.id="+id;
		userdao.excuteHqlquery(hql);
		
	}
	/**
	 * 修改用户密码
	 */
	@Override
	public void updateUserpwd(Long id, String newpwd) {
		String hql="update User u set u.password='"+newpwd+"' where u.id="+id;
		userdao.excuteHqlquery(hql);
	}

}
