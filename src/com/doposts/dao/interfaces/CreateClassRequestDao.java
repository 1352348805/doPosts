package com.doposts.dao.interfaces;

import com.doposts.entity.CreateClassRequest;
import com.doposts.vo.PostClassRequestInfo;

import java.util.List;

/**
 *  创建分类的申请的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface CreateClassRequestDao {

    /**
     * 获取未授权的分类记录数
     * @return 记录数
     */
    Integer getUnauthorizedClassCount();

    /**
     * 按条件查询请求分类数据，需排序，未审核的排前面
     * @param offset 偏移量
     * @param pageSize 取多少条
     * @return 集合
     */
    List<PostClassRequestInfo> selectAllCreateClassRequestByCondition(int offset, int pageSize);

    /**
     * 查询总记录数
     * @return 记录数
     */
    Integer selectAllCreateClassRequestCount();

    /**
     * 根据id修改创建信息
     * @param classRequest 修改实体类,属性值为空则不参与更新
     * @return 受影响的行数
     */
    Integer updateCreateClassRequestById(CreateClassRequest classRequest);
}
