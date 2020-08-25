package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.CreateClassRequest;
import com.doposts.entity.PostClass;
import com.doposts.service.interfaces.CreateClassRequestService;
import com.doposts.utils.Page;
import com.doposts.vo.PostClassRequestInfo;

import java.util.ArrayList;
import java.util.List;

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
    public Page<PostClassRequestInfo> getPageByCreateClassRequest(int pageIndex, int pageSize) {
        Page<PostClassRequestInfo> page = new Page<>();
        Integer total = PostItDatabase.CREATE_CLASS_REQUEST_DAO.selectAllCreateClassRequestCount();
        page.setTotalCount(total);
        page.setCurrPageNo(pageIndex);
        page.setPageSize(pageSize);
        Integer offSet = page.getOffSet();
        List<PostClassRequestInfo> requestInfos = PostItDatabase.CREATE_CLASS_REQUEST_DAO.selectAllCreateClassRequestByCondition(offSet, pageSize);
        page.setData(requestInfos);
        return page;
    }

    /**
     * 修改请求状态信息
     *
     * @param classRequest 修改的实体
     * @return 是否修改成功
     */
    @Override
    public boolean modifyRequestStatus(CreateClassRequest classRequest) {
        //查询分类表是否存在此分类
        CreateClassRequest request = PostItDatabase.CREATE_CLASS_REQUEST_DAO.selectCreateClassRequestById(classRequest.getRequestId());
        PostClass postClass = PostItDatabase.POST_CLASS_DAO.findPostClassByClassName(request.getClassName());

        //不存在
        if (postClass == null) {
            //同意 添加这个分类
            if (classRequest.getIsPass()) {
                postClass = new PostClass();
                postClass.setClassFatherId(request.getFatherClassId());
                postClass.setClassLevel(3);
                postClass.setClassName(request.getClassName());
                PostItDatabase.POST_CLASS_DAO.insertPostClass(postClass);
            }
        } else {
            //存在: 修改分类的状态
            postClass.setEnable(classRequest.getIsPass());
            PostItDatabase.POST_CLASS_DAO.updatePostClassById(postClass);
        }
        //最终修改分类申请返回结果
        return PostItDatabase.CREATE_CLASS_REQUEST_DAO.updateCreateClassRequestById(classRequest) > 0;
    }

    /**
     * 获取分类申请总记录数
     */
    @Override
    public Integer getCreateClassRequestCount() {
        return PostItDatabase.CREATE_CLASS_REQUEST_DAO.selectAllCreateClassRequestCount();
    }
}
