package com.doctorhelper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@RequestMapping("/toIndex.action")
	public String toIndex() {

		return "/WEB-INF/manager/index";
	}
}
