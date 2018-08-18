package com.yue.controller;

import com.yue.domain.Menu;
import com.yue.domain.Tree;
import com.yue.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class LoginController extends BaseController{

	@Autowired
	MenuService menuService;

	@RequestMapping("/")
	String index(Model model) {
		Long id = getUser().getId();
		System.out.println(id);
		List<Tree<Menu>> menus = menuService.listMenuTree(getUser().getId());
		model.addAttribute("menus", menus);
		model.addAttribute("name", getUser().getName());
		model.addAttribute("username", getUserName());
		return "index";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	/**
	 * 登录
	 */
	@RequestMapping("/main")
	public String main(){
		return "main";
	}
	/**
	 * 标题
	 */
	@RequestMapping("/top")
	public String top() {
		return "top";
	}

	/**
	 * 左侧菜单
	 */
	@RequestMapping("/left")
	public String left() {
		return "left";
	}

	/**
	 * 主页显示
	 */
	@RequestMapping("/welcome")
	public String welcome() {
		return "welcome";
	}
}

