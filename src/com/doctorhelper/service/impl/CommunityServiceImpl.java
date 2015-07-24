package com.doctorhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorhelper.dao.community.ICommunityDao;
import com.doctorhelper.entity.Community;
import com.doctorhelper.service.ICommunityService;

@Service
public class CommunityServiceImpl implements ICommunityService {
@Autowired
private ICommunityDao communitydao;
/**
 * 查询所有社区
 * @return
 */
public List<Community> queryAllCommunity(){
	return communitydao.queryAlllist(Community.class);
}
}
