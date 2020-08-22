package com.doposts.service.interfaces;

import com.doposts.entity.CreateClassRequest;
import com.doposts.utils.Page;
import com.doposts.vo.PostClassRequestInfo;

import java.util.List;

/**
 * @author asuk
 * @date 2020/8/21 11:26
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public interface CreateClassRequestService {

    /**
     * 获取未授权的分类记录数
     * @return 记录数
     */
    Integer getUnauthorizedClassCount();

    /**
     * 获取分页请求信息
     * @param pageIndex 当前页码
     * @param pageSize 显示数量
     * @return PageBean
     */
    Page<PostClassRequestInfo> getPageByCreateClassRequest(int pageIndex, int pageSize);

    /**
     * 修改请求状态信息
     * @param classRequest 修改的实体
     * @return 是否修改成功
     */
    boolean modifyRequestStatus(CreateClassRequest classRequest);

    /**
     * 获取分类申请总记录数
     */
    Integer getCreateClassRequestCount();

}
