package com.yue.service;

import com.yue.domain.LeaveBill;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by YueFeng on 2018-08-09
 */
@Service
public interface LeaveBillService {
    List<LeaveBill> findLeaveBillList(Long userId);

     void addSave(Integer days, String content, String remark, Long id);

    LeaveBill findOne(Long id);

    void editSave(Long id, Integer days, String content, String remark);

    void deleteOne(Long id);
}
