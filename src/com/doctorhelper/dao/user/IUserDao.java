package com.doctorhelper.dao.user;

import com.doctorhelper.dao.base.IBaseDao;
import com.doctorhelper.entity.User;

public interface IUserDao<User> extends IBaseDao<User> {
     User findUserByOpenId(String openId);
     User findUniqueUser(String hql);
}
