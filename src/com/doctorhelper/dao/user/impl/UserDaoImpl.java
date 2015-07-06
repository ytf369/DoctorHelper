package com.doctorhelper.dao.user.impl;

import org.springframework.stereotype.Repository;

import com.doctorhelper.dao.base.impl.BaseDaoImpl;
import com.doctorhelper.dao.user.IUserDao;
import com.doctorhelper.entity.User;
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao<User> {

	//根据Openid查询用户
	@Override
	public User findUserByOpenId(String openId) {
		User u=(User) getSession().createQuery("from User u where u.openid=?")
				.setParameter(0, openId)
				.uniqueResult();
		return u;
	}

	//查询一个用户
	@Override
	public User findUniqueUser(String hql) {
		User u=(User) getSession().createQuery(hql).uniqueResult();
		return u;
	}

}
