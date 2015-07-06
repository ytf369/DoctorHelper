package com.doctorhelper.service;

import java.util.List;

import com.doctorhelper.entity.Post;

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
}
