package com.yue;

import com.yue.domain.Employee;
import com.yue.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ActivitiProjectApplicationTests {
	@Autowired
	private EmployeeService employeeService;

	@Test
	public void contextLoads() {
		Employee su= employeeService.findEmployeeByName("范冰冰经纪人");
		BCryptPasswordEncoder bc=new BCryptPasswordEncoder(4);//将密码加密 可以先设置初始密码：000000
		su.setPassword(bc.encode(su.getPassword()));//然后使用密码为key值进行加密，运行主类后，会自动加密密码，可连接数据库查看。
		System.out.println("密码"+su.getPassword());
	}

	@Test
	public void demoTest(){
		String str = "$2a$04$zr/kqC0y/1VyvaTk0wbeT.iNzQ21iEaGp0bKswHwF5VgqKpTtT.DO";
		System.out.println(str.length());
	}

}
