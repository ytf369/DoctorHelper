package com.doctorhelper.service;

import java.util.List;

import com.doctorhelper.entity.Department;

public interface IDeptService {
List<Department> queryAllDept(); 
void saveOrupdateDept(Department dept);
Department findDeptById(Long id);
void mergeDept(Department dept);
public void deleteDept(Department dept);
}
