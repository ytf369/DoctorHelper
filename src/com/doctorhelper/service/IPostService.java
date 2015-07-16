package com.doctorhelper.service;

import java.util.List;

import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.Post;
import com.doctorhelper.entity.User;

public interface IPostService {
	//分页查询公开的全部发帖
    List<Post> queryPublicPost(int pagenum , int size);
    //分页查询公开的全部和本人的全部发帖
    List<Post> queryPublicPostandMine(int pagenum , int size,Long userid);
    //分页查询所有公开和未公开的全部发帖
    List<Post> quaryAllPost(int pagenum , int size);
    //查询公开的全部和本人的全部发帖总条数
    Long queryPublicPostandMineCount(Long userid);
    //查询全部所有公开和未公开的总条数
    Long queryAllPostCount();
    //根据ID获取发帖
    Post findPostById(long id);
    //保存发帖
    Message savePost(Post p);
    //更新发帖的更新时间
    void updatePostupdatetime(Post p);
    //分页查询未回复的发帖
    List<Post> querynoreplyPost(int pagenum , int size);
    //查询未回复的发帖数；
    Long querynoreplyCount();
    //按更新时间查询已回复的
    List<Post> queryhasreplyPost(int pagenum , int size);
    //已回复的数量
    Long  queryhasreplyCount();
    //我回复的发帖
    List<Post> queryPostWithMyReply(User u,int pagenum , int size);
    //查询我回复的数量
    Long queryPostWithMyReplyCount(User u);
    //分页查询我的发帖
    List<Post> querymyPosts(User u,int pagenum , int size);
    //查询我发帖的数量
    Long querymyPostsCount(User u);
}
