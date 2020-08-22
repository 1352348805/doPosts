package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.CreateClassRequestDao;
import com.doposts.entity.CreateClassRequest;
import com.doposts.vo.PostClassRequestInfo;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        try {
             return executeQueryToBeanList("SELECT\n" +
                    "\trequest.requestId, \n" +
                    "\trequest.requestUserId, \n" +
                    "\trequest.className, \n" +
                    "\trequest.fatherClassId, \n" +
                    "\trequest.requestDate, \n" +
                    "\trequest.isProcess, \n" +
                    "\trequest.isPass, \n" +
                    "\trequest.reviewerId, \n" +
                    "\trequest.reviewDate, \n" +
                    "\tpostClass.className AS fatherClassName, \n" +
                    "\trequestUser.userName AS requestName, \n" +
                    "\treviewerUser.userName AS reviewerName\n" +
                    "FROM\n" +
                    "\tcreate_class_request AS request\n" +
                    "LEFT JOIN `user` AS requestUser ON request.requestUserId = requestUser.userId\n" +
                    "LEFT JOIN post_classification AS postClass ON request.fatherClassId = postClass.classId\n" +
                    "LEFT JOIN `user` AS reviewerUser ON request.reviewerId = reviewerUser.userId ORDER BY request.isProcess limit ?,?", PostClassRequestInfo.class, offset, pageSize);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询总记录数
     * @return 记录数
     */
    @Override
    public Integer selectAllCreateClassRequestCount() {
        return selectCount(CreateClassRequest.class);
    }

    /**
     * 根据id修改创建信息
     *
     * @param classRequest 修改实体类,属性值为空则不参与更新
     * @return 受影响的行数
     */
    @Override
    public Integer updateCreateClassRequestById(CreateClassRequest classRequest) {
        try {
            return update(classRequest);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据id获取请求分类
     *
     * @param requestId 主键
     * @return 实体
     */
    @Override
    public CreateClassRequest selectCreateClassRequestById(int requestId) {
        return null;
    }
}
