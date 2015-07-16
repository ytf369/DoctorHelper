package com.doctorhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorhelper.dao.dept.IDeptDao;
import com.doctorhelper.entity.Department;
import com.doctorhelper.service.IDeptService;
@Service
public class DeptServiceImpl implements IDeptService {
    @Autowired
	private IDeptDao deptdao;
    /**
     * 查询所有科室
     */
	@Override
	public List<Department> queryAllDept() {
		return deptdao.queryAlllist(Department.class);
	}
	/**
	 * 添加或保存科室
	 */
    public void saveOrupdateDept(Department dept){
    	deptdao.saveorupdate(dept);
    }
    /**
     * 查询某个科室
     */
	@Override
	public Department findDeptById(Long id) {
		return deptdao.findById(Department.class, id);
	}
	/**
	 * 更新科室
	 */
	@Override
	public void mergeDept(Department dept) {
		deptdao.getSession().merge(dept);
	}
	/**
	 * 删除科室
	 */
	public void deleteDept(Department dept){
		deptdao.delete(dept);
	}
}
