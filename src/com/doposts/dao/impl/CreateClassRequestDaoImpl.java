package com.doposts.dao.impl;

import com.doposts.dao.CrudHandler;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.CreateClassRequestDao;
import com.doposts.entity.CreateClassRequest;
import com.doposts.vo.PostClassRequestInfo;
import com.dxhualuo.database.handler.interfaces.DatabaseCrud;
import com.dxhualuo.database.handler.interfaces.SuperCrud;
import java.sql.SQLException;
import java.util.List;

/**
 * 创建分类的申请DAO的实现，在此添加方法以实现接口
 * @author dx_hualuo
 */
public class CreateClassRequestDaoImpl implements CreateClassRequestDao {
    SuperCrud<CreateClassRequest> crud;
    DatabaseCrud basicCrud;

    public CreateClassRequestDaoImpl() {
        this.crud = CrudHandler.createClassRequestCrud;
        this.basicCrud = PostItDatabase.getCRUD();
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
            return crud.selectCount(CreateClassRequest.class, createClassRequest);
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
            return crud.executeQueryToBeanList("SELECT\n" +
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
                    "LEFT JOIN `user` AS reviewerUser ON request.reviewerId = reviewerUser.userId ORDER BY request.isProcess,request.requestId limit ?,?", PostClassRequestInfo.class, offset, pageSize);
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
        return crud.selectCount(CreateClassRequest.class);
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
            return crud.update(classRequest);
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
        CreateClassRequest createClassRequest = new CreateClassRequest();
        createClassRequest.setRequestId(requestId);
        try {
            List<CreateClassRequest> requests = crud.select(CreateClassRequest.class, createClassRequest);
            if(requests != null && requests.size() == 1){
                return requests.get(0);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
