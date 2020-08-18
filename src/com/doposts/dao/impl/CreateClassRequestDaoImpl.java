package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.CreateClassRequestDao;
import com.doposts.entity.CreateClassRequest;
import com.dxhualuo.database.impl.MySQL_C3P0;

/**
 * 创建分类的申请DAO的实现，在此添加方法以实现接口
 * @author dx_hualuo
 */
public class CreateClassRequestDaoImpl extends MySQL_C3P0<CreateClassRequest> implements CreateClassRequestDao {
    public CreateClassRequestDaoImpl(){
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
    }
}
