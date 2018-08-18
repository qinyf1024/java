package com.yue.domain;

/**
 * Created by YueFeng on 2018-08-07
 */
public class SysRole {
    private int id;

    private String name;//角色名称

    private Employee employee;//角色对应的用户实体

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
