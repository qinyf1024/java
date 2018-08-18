package com.yue.utils;

import com.yue.domain.Employee;
import com.yue.service.EmployeeService;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 员工经理任务分配
 */
public class ManagerTaskHandler implements TaskListener {

    @Override
    public void notify(DelegateTask delegateTask) {
        //设置个人任务的办理人
        /**获取当前用户对应的领导*/
        //使用当前用户名查询用户的详细信息
        Employee employee = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long id = employee.getManagerId();
        //从ApplicationContext中获取spring容器
        EmployeeService employeeService = SpringUtil.getBean(EmployeeService.class);
        //使用领导ID查询出领导信息，根据ID查询用户
        Employee emp = employeeService.findId(id);

        delegateTask.setAssignee(emp.getName());
    }

}
