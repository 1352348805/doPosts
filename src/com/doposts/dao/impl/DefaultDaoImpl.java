package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.DefaultDao;
import com.dxhualuo.database.impl.MySQL_C3P0;

/**
 *  基本的Dao
 * @author dx_hualuo
 */
public class DefaultDaoImpl extends MySQL_C3P0<Object> implements DefaultDao {
    public DefaultDaoImpl() {
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
    }
}
