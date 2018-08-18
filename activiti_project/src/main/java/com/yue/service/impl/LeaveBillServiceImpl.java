package com.yue.service.impl;

import com.yue.dao.LeaveBillDao;
import com.yue.domain.LeaveBill;
import com.yue.service.LeaveBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by YueFeng on 2018-08-09
 */
@Service
public class LeaveBillServiceImpl implements LeaveBillService{
    @Autowired
    LeaveBillDao leaveBillDao;
    /**查询自己的请假单的信息*/
    @Override
    public List<LeaveBill> findLeaveBillList(Long userId) {
        return leaveBillDao.findLeaveBillList(userId);
    }

    @Override
    public void addSave(Integer days, String content, String remark, Long id) {
        leaveBillDao.addSave(days,content,remark,id);
    }

    @Override
    public LeaveBill findOne(Long id) {
        return leaveBillDao.findOne(id);
    }

    @Override
    public void editSave(Long id, Integer days, String content, String remark) {
        leaveBillDao.editSave(id,days,content,remark);
    }

    @Override
    public void deleteOne(Long id) {
        leaveBillDao.deleteOne(id);
    }
}
