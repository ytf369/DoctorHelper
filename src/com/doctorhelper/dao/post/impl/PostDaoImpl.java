package com.doctorhelper.dao.post.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.doctorhelper.dao.base.impl.BaseDaoImpl;
import com.doctorhelper.dao.post.IPostDao;
import com.doctorhelper.entity.Post;
@Repository
public class PostDaoImpl extends BaseDaoImpl<Post> implements IPostDao {
}
