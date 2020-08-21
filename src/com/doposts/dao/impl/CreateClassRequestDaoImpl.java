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
             ResultSet rs = executeQuery("SELECT\n" +
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
                    "LEFT JOIN `user` AS reviewerUser ON request.reviewerId = reviewerUser.userId limit ?,?", offset, pageSize);
             List<PostClassRequestInfo> infos = new ArrayList<>();
             while(rs.next()){
                 PostClassRequestInfo info = new PostClassRequestInfo();
                 info.setRequestId(rs.getInt("requestId"));
                 info.setRequestUserId(rs.getInt("requestUserId"));
                 info.setClassName(rs.getString("className"));
                 info.setFatherClassId(rs.getInt("fatherClassId"));
                 info.setRequestDate(rs.getDate("requestDate"));
                 info.setIsProcess(rs.getBoolean("isProcess"));
                 info.setIsPass(rs.getBoolean("isPass"));
                 info.setReviewerId(rs.getInt("reviewerId"));
                 info.setReviewDate(rs.getDate("reviewDate"));
                 info.setFatherClassName(rs.getString("fatherClassName"));
                 info.setRequestName(rs.getString("requestName"));
                 info.setReviewerName(rs.getString("reviewerName"));
                 infos.add(info);
             }
             return infos;
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
}
