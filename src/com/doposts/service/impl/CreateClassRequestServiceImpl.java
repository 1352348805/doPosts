package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.CreateClassRequest;
import com.doposts.service.interfaces.CreateClassRequestService;
import com.doposts.utils.Page;

/**
 * @author asuk
 * @date 2020/8/21 11:31
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class CreateClassRequestServiceImpl implements CreateClassRequestService {

    /**
     * 获取未授权的分类记录数
     *
     * @return 记录数
     */
    @Override
    public Integer getUnauthorizedClassCount() {
        return PostItDatabase.CREATE_CLASS_REQUEST_DAO.getUnauthorizedClassCount();
    }

    /**
     * 获取分页请求信息
     *
     * @param pageIndex 当前页码
     * @param pageSize  显示数量
     * @return PageBean
     */
    @Override
    public Page<CreateClassRequest> getPageByCreateClassRequest(int pageIndex, int pageSize) {
        Page<CreateClassRequest> page = new Page<>();
        //TODO
        Integer offSet = page.getOffSet();
        PostItDatabase.CREATE_CLASS_REQUEST_DAO.selectAllCreateClassRequestByCondition(offSet,pageSize);
        return null;
    }
}
