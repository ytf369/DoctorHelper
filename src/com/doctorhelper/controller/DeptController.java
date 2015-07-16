package com.doctorhelper.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doctorhelper.entity.Department;
import com.doctorhelper.entity.PageList;
import com.doctorhelper.service.IDeptService;

@Controller
@RequestMapping("/dept")
public class DeptController {
	@Autowired
private IDeptService deptservice;
	/**
	 * 查询所有科室
	 * @param model
	 * @return
	 */
	@RequestMapping("/querydepts.action")
	public String querydepts(Model model){
		List<Department> depts=deptservice.queryAllDept();
		PageList pl=new PageList();
		pl.setList(depts);
		model.addAttribute("pagerows", pl);
		model.addAttribute("menu","deptsMenu");
		return "/WEB-INF/manager/department";
	}
	/**
	 * 更新或添加科室
	 * @param dept
	 * @return
	 */
	@RequestMapping("/saveOrupdateDept.action")
	public String saveOrupdateDept(Department dept1){
		if(dept1.getId()==null){
			dept1.setCreatetime(new Date());
			dept1.setUpdatetime(new Date());
			deptservice.saveOrupdateDept(dept1);
		}
		else{
			dept1.setCreatetime(deptservice.findDeptById(dept1.getId()).getCreatetime());
			dept1.setUpdatetime(new Date());
			deptservice.mergeDept(dept1);
		}
		
		return "redirect:/dept/querydepts.action";
	}
	/**
	 * 删除科室
	 * @param delid
	 * @return
	 */
	@RequestMapping("/deleteDept.action")
	public String deleteDept(Long delid){
		System.out.println("delID"+delid);
		Department dept=deptservice.findDeptById(delid);
		deptservice.deleteDept(dept);
		return "redirect:/dept/querydepts.action";
	}
}
