package com.cg.crud.service;

import com.cg.crud.bean.Department;

import java.util.List;

/**
 * @program: SSM-CRUD->DepartmentService
 * @description:
 * @author: cg
 * @create: 2020-01-05 14:36
 **/

public interface DepartmentService {

    /**
     * 查询所以的部门信息
     * @return
     */
    List<Department> getDepartments();

}
