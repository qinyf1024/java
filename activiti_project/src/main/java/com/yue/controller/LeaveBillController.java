package com.yue.controller;

import com.yue.domain.Employee;
import com.yue.domain.LeaveBill;
import com.yue.service.EmployeeService;
import com.yue.service.LeaveBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by YueFeng on 2018-08-09
 */
@Controller
public class LeaveBillController extends BaseController{
    @Autowired
    LeaveBillService leaveBillService;
    /**
     * 请假管理首页显示
     */
    @RequestMapping("/home")
    public String home(Model model){
        Long id = getUser().getId();
        //1：查询所有的请假信息（对应a_leavebill），返回List<LeaveBill>
        List<LeaveBill> list = leaveBillService.findLeaveBillList(id);
        //放置到Model对象中
        model.addAttribute("list", list);
        return "/leaveBill/list";
    }

    /**
     * 添加页面跳转
     */
    @RequestMapping("/add")
    public String add(){
        return "/leaveBill/add";
    }


    /**
     * 添加请假申请
     */
    @RequestMapping("addSave")
    public String addSave(@RequestParam("days") Integer days,
                          @RequestParam("content") String content,
                          @RequestParam("remark") String remark){
        Long id = getUser().getId();
        leaveBillService.addSave(days,content,remark,id);
        return "redirect:/home";
    }

    /**
     * 跳转修改请假申请
     */
    @RequestMapping("/edit")
    public String edit(@RequestParam("id") Long id, Model model){
        //根据ID查询数据，回显页面
        LeaveBill list = leaveBillService.findOne(id);
        model.addAttribute("list",list);
        return "/leaveBill/edit";
    }


    /**
     * 保存/更新，请假申请
     */
    @RequestMapping("/editSave")
    public String editSave(@RequestParam("id") Long id,
                           @RequestParam("days") Integer days,
                           @RequestParam("content") String content,
                           @RequestParam("remark") String remark) {
        leaveBillService.editSave(id,days,content,remark);
        return "redirect:/home";
    }

    /**
     * 删除，请假申请
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        leaveBillService.deleteOne(id);
        return "redirect:/home";
    }

}
