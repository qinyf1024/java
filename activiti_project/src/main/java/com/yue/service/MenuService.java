package com.yue.service;

import com.yue.domain.Menu;
import com.yue.domain.Tree;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by YueFeng on 2018-08-09
 */
@Service
public interface MenuService {
    List<Tree<Menu>> listMenuTree(Long id);
}
