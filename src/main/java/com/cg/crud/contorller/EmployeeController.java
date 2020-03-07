package com.cg.crud.contorller;

import com.cg.crud.bean.Employee;
import com.cg.crud.service.EmployeeService;
import com.cg.crud.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: SSM-CRUD->EmployeeController
 * @description: 处理员工CRUD请求
 * @author: cg
 * @create: 2020-01-02 20:00
 **/

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 单个删除和批量删除二合一
     * 批量删除：1-2-3-4
     * 单个删除：1
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "employee/{ids}", method = RequestMethod.DELETE)
    public Msg deleteEmployee(@PathVariable("ids") String ids) {
        if (ids.contains("-")) {
            String[] split = ids.split("-");
            List<Integer> list = new ArrayList<>();
            for (String s : split) {
                list.add(Integer.parseInt(s));
            }
            if (employeeService.deleteBatch(list)) {
                return Msg.success();
            }
            return Msg.error();
        } else {
            if (employeeService.deleteEmployee(Integer.parseInt(ids))) {
                return Msg.success();
            }
            return Msg.error();
        }
    }

    /**
     * 更新员工信息
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "employee/{empId}", method = RequestMethod.PUT)
    public Msg saveEmployee(Employee employee) {
        if (employeeService.updateEmployee(employee)) {
            return Msg.success();
        } else {
            return Msg.error();
        }
    }

    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "employee/{id}", method = RequestMethod.GET)
    public Msg getEmployee(@PathVariable("id") Integer id) {
        Employee employee = employeeService.getEmployee(id);
        return Msg.success().add("employee", employee);
    }

    /**
     * 校验该用户名是否已存在
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkUser")
    public Msg checkUser(@RequestParam("empName") String empName) {
        String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if (!empName.matches(regex)) {
            return Msg.error().add("check_message", "用户名必须是2-5位中文或者6-16位英文和数字的组合");
        }
        if (employeeService.checkUser(empName)) {
            return Msg.success().add("check_message", "该用户名可用");
        } else {
            return Msg.error().add("check_message", "该用户已被注册");
        }
    }

    /**
     * 员工保存
     * 支持JSR303校验 @Valid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "employee", method = RequestMethod.POST)
    public Msg saveEmployee(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            //校验失败，返回错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误的字段名：" + error.getField());
                System.out.println("错误信息：" + error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.error().add("errors", map);
        } else {
            employeeService.saveEmployee(employee);
            return Msg.success();
        }
    }

    /**
     * 导入json包
     * @param page
     * @return
     */
    @ResponseBody
    @RequestMapping("/emps")
    public Msg getEmployeeWithJson(@RequestParam(value = "page", defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 8);
        List<Employee> employeeList = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(employeeList, 6);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 查询员工数据（分页查询）
     * @return
     */
    /*@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
        *//*
        * 引入PageHelper分页插件
        * <dependency>
            <groupId>com.github.pagehelper</groupId>
            <artifactId>pagehelper</artifactId>
            <version>5.0.0</version>
          </dependency>
          * 配置
          * <plugins>
                <plugin interceptor="com.github.pagehelper.PageInterceptor"></plugin>
            </plugins>
          *
        *//*
        *//*
           在查询前只需要调用 PageHelper.startPage(pageNum, pageSize)
            后面跟着查询
        *//*
        PageHelper.startPage(page, 8);
        List<Employee> employeeList = employeeService.getAll();
        *//*
            查询完后可以使用pageInfo包装,只需要将pageInfo交给页面就可以
            pageInfo包装了详细的分页信息，navigatePages：传入显示的页数
         *//*
        PageInfo pageInfo = new PageInfo(employeeList, 6);
        model.addAttribute("pageInfo", pageInfo);
        return "list";
    }*/

}
