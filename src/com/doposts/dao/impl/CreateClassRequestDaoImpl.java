package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.CreateClassRequestDao;
import com.doposts.entity.CreateClassRequest;
import com.doposts.vo.PostClassRequestInfo;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.sql.SQLException;
import java.util.List;

/**
 * 创建分类的申请DAO的实现，在此添加方法以实现接口
 * @author dx_hualuo
 */
public class CreateClassRequestDaoImpl extends MySQL_C3P0<CreateClassRequest> implements CreateClassRequestDao {
    public CreateClassRequestDaoImpl(){
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
    }

    /**
     * 获取未授权的分类记录数
     *
     * @return 记录数
     */
    @Override
    public Integer getUnauthorizedClassCount() {
        CreateClassRequest createClassRequest = new CreateClassRequest();
        createClassRequest.setIsProcess(false);
        try {
            return selectCount(CreateClassRequest.class, createClassRequest);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 按条件查询请求分类数据，需排序，未审核的排前面
     *
     * @param offset   偏移量
     * @param pageSize 取多少条
     * @return 集合
     */
    @Override
    public List<PostClassRequestInfo> selectAllCreateClassRequestByCondition(int offset, int pageSize) {
//        try {
//            return executeQueryToBeanList("SELECT * FROM `create_class_request` ORDER BY create_class_request.isProcess ASC LIMIT ?, ?", CreateClassRequest.class, offset, pageSize);
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
        return null;
    }

    /**
     * 查询总记录数
     * @return 记录数
     */
    @Override
    public Integer selectAllCreateClassRequestCount() {
        return selectCount(CreateClassRequest.class);
    }
}
