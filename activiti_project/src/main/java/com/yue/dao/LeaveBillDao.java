package com.yue.dao;

import com.yue.domain.LeaveBill;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by YueFeng on 2018-08-09
 */
@Mapper
public interface LeaveBillDao {

    List<LeaveBill> findLeaveBillList(Long userId);

    void addSave(@Param("days") Integer days,@Param("content") String content,@Param("remark") String remark,@Param("id") Long id);

    LeaveBill findOne(Long id);

    void editSave(@Param("id") Long id, @Param("days") Integer days, @Param("content") String content, @Param("remark") String remark);

    void deleteOne(Long id);

    void updateState(Long id);

    void updateState2(Long id);
}
