package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.FloorDao;
import com.doposts.entity.Floor;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.sql.SQLException;
import java.util.List;

/**
 *  楼层的DAO实现
 * @author dx_hualuo
 */
public class FloorDaoImpl extends MySQL_C3P0<Floor> implements FloorDao {
    public FloorDaoImpl(){
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
    }

    /**
     * 用id获取正文
     *
     * @param postId 帖子id
     * @return 所有楼层信息
     */
    @Override
    public List<Floor> getFloorByPostId(Integer postId) {
        Floor floor = new Floor();
        floor.setPostId(postId);
        try {
            return select(Floor.class, floor);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
