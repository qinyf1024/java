package com.yue.dao;

import com.yue.domain.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeeDao {

	Employee findEmployeeByName(String name);

    Employee findId(@Param("id") Long id);
}
