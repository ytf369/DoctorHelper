package com.doctorhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorhelper.dao.post.IPostDao;
import com.doctorhelper.entity.Post;
import com.doctorhelper.service.IPostService;
@Service
public class PostServiceImpl implements IPostService {
@Autowired
private IPostDao postdao;
	/**
	 * 分页查询公开的全部发帖
	 */
	@Override
	public List<Post> queryPublicPost(int pagenum, int size) {
		String hql="from Post p where p.ispublic=1";
		return postdao.querylistWithPage(hql, pagenum, size);
	}
	/**
	 * 分页查询公开的全部和本人的全部发帖
	 */
	@Override
	public List<Post> queryPublicPostandMine(int pagenum, int size, Long userid) {
		String hql="from Post p where p.ispublic=1 or p.user.id="+userid;
		return postdao.querylistWithPage(hql, pagenum, size);
	}
	/**
	 * 查询公开的全部和本人的全部发帖总条数
	 */
	@Override
	public Long queryPublicPostandMineCount( Long userid) {
		String hql="Select count(id) from Post p where p.ispublic=1 or p.user.id="+userid;
		return postdao.querylistCount(hql);
	}
	/**
	 * 分页查询所有公开和未公开的全部发帖
	 */
	@Override
	public List<Post> quaryAllPost(int pagenum, int size) {
		String hql="from Post p order by p.updatetime desc";
		return postdao.querylistWithPage(hql, pagenum, size);
	}
	/**
	 * 查询全部发帖总数
	 */
	@Override
	public Long queryAllPostCount() {
		String hql="select count(id) from Post";
		return postdao.querylistCount(hql);
	}
	/**
	 * 根据Id获取帖子
	 */
	@Override
	public Post findPostById(long id) {
		return postdao.findById(Post.class, id);
	}

}
