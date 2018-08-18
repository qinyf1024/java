package com.yue.service;

import com.yue.domain.Employee;
import org.springframework.stereotype.Service;

@Service
public interface EmployeeService {

	Employee findEmployeeByName(String name);

    Employee findId(Long id);
}
