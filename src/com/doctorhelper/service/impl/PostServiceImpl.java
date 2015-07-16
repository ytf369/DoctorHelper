package com.doctorhelper.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import oracle.sql.DATE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorhelper.dao.post.IPostDao;
import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.Post;
import com.doctorhelper.entity.Reply;
import com.doctorhelper.entity.User;
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
		String hql="from Post p where p.ispublic=1 order by p.updatetime desc";
		return postdao.querylistWithPage(hql, pagenum, size);
	}
	/**
	 * 分页查询公开的全部和本人的全部发帖
	 */
	@Override
	public List<Post> queryPublicPostandMine(int pagenum, int size, Long userid) {
		String hql="from Post p where p.ispublic=1 or p.user.id="+userid+" order by p.updatetime desc";
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
	 * 后台医生：分页查询所有公开和未公开的全部发帖，优先回复为0的；
	 */
	@Override
	public List<Post> quaryAllPost(int pagenum, int size) {
		//回复数为0的
		String sql="select * from dh_post p where p.id  not in (select post_id from dh_reply where post_id is not NULL)  "+
				"union all select * from dh_post p where p.id in (select post_id from dh_reply where post_id is not NULL) order by updatetime desc";
				;
		List<Post> list1=postdao.querylistNativeSqlWithPage(sql, Post.class,pagenum,size);
		return list1;
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
	/**
	 * 保存发帖
	 */
	@Override
	public Message savePost(Post p) {
		Message mg=new Message();
		try {
			postdao.save(p);
			mg.setCode(1);
			mg.setText("success");
		} catch (Exception e) {
			e.printStackTrace();
			mg.setCode(0);
			mg.setText("falied");
		}
		
		return mg;
	}
	/**
	 * 分页查询未回复的发帖
	 */
	@Override
	public List<Post> querynoreplyPost(int pagenum , int size) {
	String sql="select * from dh_post p where p.id  not in (select post_id from dh_reply where post_id is not NULL) order by updatetime";
	List<Post> list=postdao.querylistNativeSqlWithPage(sql, Post.class,pagenum,size);
		return list;
	}
	/**
	 * 按更新时间查询已回复的
	 */
	@Override
	public List<Post> queryhasreplyPost(int pagenum, int size) {
		String sql="select * from dh_post p where p.id in (select post_id from dh_reply where post_id is not NULL) order by updatetime desc";
		List<Post> list=postdao.querylistNativeSqlWithPage(sql, Post.class,pagenum,size);
		return list;
	}
	/**
	 * 查询我回复的发帖
	 */
	@Override
	public List<Post> queryPostWithMyReply(User u,int pagenum , int size) {
		String sql="select * from dh_post where id in (select r.post_id from dh_reply r where r.user_id="+u.getId()+")";
		return postdao.querylistNativeSqlWithPage(sql, Post.class, pagenum, size);
	}
	/**
	 * 未回复的数量
	 */
	@Override
	public Long querynoreplyCount() {
		String sql="select count(id) from dh_post p where p.id not in (select post_id from dh_reply where post_id is not NULL) ";
		return postdao.querylistSqlCount(sql);
	}
	/**
	 * 已回复的数量
	 */
	@Override
	public Long queryhasreplyCount() {
		String sql="select count(id) from dh_post p where p.id  in (select post_id from dh_reply where post_id is not NULL) ";
		return postdao.querylistSqlCount(sql);
	}
	/**
	 * 查询我回复的数量
	 */
	@Override
	public Long queryPostWithMyReplyCount(User u) {
		String sql="select count(id) from dh_post where id in (select r.post_id from dh_reply r where r.user_id="+u.getId()+")";
		return postdao.querylistSqlCount(sql);
	}
	/**
	 * 分页查询我的发帖
	 */
	@Override
	public List<Post> querymyPosts(User u, int pagenum, int size) {
		String hql="from Post p where p.user.id="+u.getId()+" order by p.updatetime desc";
		return postdao.querylistWithPage(hql, pagenum, size);
	}
	/**
	 * 查询我发帖的数量
	 */
	@Override
	public Long querymyPostsCount(User u) {
		String hql="select count(id) from Post p where p.user.id="+u.getId();
		return postdao.querylistCount(hql);
	}
	/**
	 * 更新帖子的更新时间
	 */
	@Override
	public void updatePostupdatetime(Post p) {
		//String hql="update Post p set p.updatetime=now() where p.id="+p.getId();
	    p.setUpdatetime(new Date()); 
		postdao.getSession().merge(p);
	}
	
}
