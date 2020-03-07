package com.cg.crud.service;

import com.cg.crud.bean.Employee;

import java.util.List;

/**
 * @program: SSM-CRUD->EmployeeService
 * @description:
 * @author: cg
 * @create: 2020-01-02 20:10
 **/

public interface EmployeeService {

    /**
     * 返回全部Employee
     * @return
     */
    List<Employee> getAll();

    /**
     * 保存员工
     * @param employee
     * @return
     */
    boolean saveEmployee(Employee employee);

    /**
     * 检验用户名是否已存在
     * @return
     * @param empName
     */
    boolean checkUser(String empName);

    /**
     * 通过id获取员工信息
     * @param id
     * @return
     */
    Employee getEmployee(Integer id);

    /**
     * 更新员工信息
     * @param employee
     * @return
     */
    boolean updateEmployee(Employee employee);

    /**
     * 根据id删除员工
     * @param id
     * @return
     */
    boolean deleteEmployee(Integer id);

    /**
     * 根据id批量删除员工
     * @param ids
     * @return
     */
    boolean deleteBatch(List<Integer> ids);
}
