package com.cg.crud.service.impl;

import com.cg.crud.bean.Department;
import com.cg.crud.dao.DepartmentMapper;
import com.cg.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: SSM-CRUD->DepartmentServiceImpl
 * @description:
 * @author: cg
 * @create: 2020-01-05 14:38
 **/

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDepartments() {
        return departmentMapper.selectByExample(null);
    }
}
