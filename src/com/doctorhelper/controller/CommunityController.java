package com.doctorhelper.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doctorhelper.entity.Community;
import com.doctorhelper.service.ICommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
@Autowired
private ICommunityService communityser;
/**
 * 查询所有社区
 * @return
 */
@ResponseBody
@RequestMapping("/queryAllCommunity.action")
public List<Community> queryAllCommunity(){
	return communityser.queryAllCommunity();
}
}
