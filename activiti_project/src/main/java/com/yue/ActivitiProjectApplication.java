package com.yue;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@MapperScan("com.yue.dao")
@SpringBootApplication
public class ActivitiProjectApplication {
	public static void main(String[] args) {
		SpringApplication.run(ActivitiProjectApplication.class, args);
		System.out.println("项目启动成功....");
	}
}
