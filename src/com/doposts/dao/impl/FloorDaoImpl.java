package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.FloorDao;
import com.doposts.entity.Floor;
import com.dxhualuo.database.impl.MySQL_C3P0;

/**
 *  楼层的DAO实现
 * @author dx_hualuo
 */
public class FloorDaoImpl extends MySQL_C3P0<Floor> implements FloorDao {
    public FloorDaoImpl(){
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
    }

}
