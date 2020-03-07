package com.cg.crud.contorller;

import com.cg.crud.bean.Department;
import com.cg.crud.service.DepartmentService;
import com.cg.crud.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @program: SSM-CRUD->EmployeeController
 * @description: 处理与部门相关的请求
 * @author: cg
 * @create: 2020-01-02 20:00
 **/

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    /**
     * 返回所有的部门信息
     */
    @ResponseBody
    @RequestMapping("/getDepartments")
    public Msg getDepartments() {
        List<Department> departments = departmentService.getDepartments();
        return Msg.success().add("departments", departments);
    }

}
