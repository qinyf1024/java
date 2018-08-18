package com.yue.dao;

import com.yue.domain.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by YueFeng on 2018-08-09
 */
@Mapper
public interface MenuDao {
    List<Menu> listMenuByUserId(Long id);
}
