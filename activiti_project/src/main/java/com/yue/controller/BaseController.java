package com.yue.controller;

import com.yue.domain.Employee;
import com.yue.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by YueFeng on 2018-08-08
 */
@Controller
public class BaseController {
    @Autowired
    private EmployeeService employeeService;

    public String getUserName() {
        String name= SecurityContextHolder.getContext().getAuthentication().getName();
        return name;
    }

    public Employee getUser(){
        Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return employee;
    }

}
