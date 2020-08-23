package com.doposts.dao.impl;

import com.doposts.dao.CrudHandler;
import com.doposts.dao.interfaces.FloorDao;
import com.doposts.entity.Floor;
import com.dxhualuo.database.handler.interfaces.SuperCrud;
import java.sql.SQLException;
import java.util.List;

/**
 *  楼层的DAO实现
 * @author dx_hualuo
 */
public class FloorDaoImpl implements FloorDao{

    SuperCrud<Floor> crud;

    public FloorDaoImpl() {
        this.crud = CrudHandler.floorCrud;
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
            return crud.select(Floor.class, floor);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
