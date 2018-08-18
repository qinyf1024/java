package com.yue.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户表
 */
public class Employee {
	private Long id;//主键ID
	private String name;//用户名
	private String password;//密码
	private String email;//电子邮箱
	private String role;//角色
	private Long managerId;
	private Set<SysRole> SysRoles = new HashSet<SysRole>(0);// 所对应的角色集合

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	public Set<SysRole> getSysRoles() {
		return SysRoles;
	}

	public void setSysRoles(Set<SysRole> sysRoles) {
		SysRoles = sysRoles;
	}

	@Override
	public String toString() {
		return "Employee{" +
				"id=" + id +
				", name='" + name + '\'' +
				", password='" + password + '\'' +
				", email='" + email + '\'' +
				", role='" + role + '\'' +
				", managerId=" + managerId +
				", SysRoles=" + SysRoles +
				'}';
	}
}

