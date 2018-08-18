package com.yue.service.impl;

import com.yue.dao.MenuDao;
import com.yue.domain.Menu;
import com.yue.domain.Tree;
import com.yue.service.MenuService;
import com.yue.utils.BuildTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by YueFeng on 2018-08-09
 */
@Service
public class MenuServiceImpl implements MenuService{

    @Autowired
    MenuDao menuDao;

    /**
     *树形菜单
     */
    @Override
    public List<Tree<Menu>> listMenuTree(Long id) {
        List<Tree<Menu>> trees = new ArrayList<>();
        List<Menu> menus = menuDao.listMenuByUserId(id);
        for (Menu menu : menus) {
            Tree<Menu> tree = new Tree<>();
            tree.setId(menu.getMenuId().toString());
            tree.setParentId(menu.getParentId().toString());
            tree.setText(menu.getName());
            Map<String, Object> attributes = new HashMap<>(16);
            attributes.put("url", menu.getUrl());
            attributes.put("icon", menu.getIcon());
            tree.setAttributes(attributes);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        List<Tree<Menu>> list = BuildTree.buildList(trees, "0");
        return list;
    }
}
