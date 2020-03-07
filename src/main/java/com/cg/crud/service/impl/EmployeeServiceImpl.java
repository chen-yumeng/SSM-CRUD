package com.cg.crud.service.impl;

import com.cg.crud.bean.Employee;
import com.cg.crud.bean.EmployeeExample;
import com.cg.crud.dao.EmployeeMapper;
import com.cg.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: SSM-CRUD->EmployeeServiceImpl
 * @description:
 * @author: cg
 * @create: 2020-01-02 20:15
 **/

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public boolean saveEmployee(Employee employee) {
        return employeeMapper.insertSelective(employee)==0;
    }

    @Override
    public boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    @Override
    public Employee getEmployee(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        int i = employeeMapper.updateByPrimaryKeySelective(employee);
        return i!=0;
    }

    @Override
    public boolean deleteEmployee(Integer id) {
        return employeeMapper.deleteByPrimaryKey(id)!=0;
    }

    @Override
    public boolean deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        return employeeMapper.deleteByExample(example)!=0;
    }
}
