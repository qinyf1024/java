package com.yue.service.impl;


import com.yue.dao.EmployeeDao;
import com.yue.domain.Employee;
import com.yue.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;

	
	/**使用用户名作为查询条件，查询用户对象*/
	@Override
	public Employee findEmployeeByName(String name) {
		Employee employee = employeeDao.findEmployeeByName(name);
		return employee;
	}

	@Override
	public Employee findId(Long id) {
		return employeeDao.findId(id);
	}

}
