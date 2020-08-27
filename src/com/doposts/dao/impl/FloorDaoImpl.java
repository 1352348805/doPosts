package com.doposts.dao.impl;

import com.doposts.dao.Count;
import com.doposts.dao.CrudHandler;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.FloorDao;
import com.doposts.entity.Floor;
import com.dxhualuo.database.handler.interfaces.DatabaseCrud;
import com.dxhualuo.database.handler.interfaces.SuperCrud;
import java.sql.SQLException;
import java.util.List;

/**
 *  楼层的DAO实现
 * @author dx_hualuo
 */
public class FloorDaoImpl implements FloorDao{

    SuperCrud<Floor> crud;

    DatabaseCrud basicCrud;

    public FloorDaoImpl() {
        this.crud = CrudHandler.floorCrud;
        this.basicCrud = PostItDatabase.getCRUD();
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

    /**
     *  通过postId获得当前帖子的最大楼数
     * @return 最大楼数
     */
    @Override
    public int getMaxFloorByPostId(Integer postId) {
        Count count;
        try {
            count = crud.executeQueryToBean("SELECT MAX(`postFloor`) as count FROM `floor` WHERE `postId` = ?", Count.class, postId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(count != null){
            return (int)(long)count.getCount();
        }
        return 0;
    }

    /**
     * 插入楼正文
     *
     * @param floor 楼所有数据
     * @return 成功
     */
    @Override
    public Integer insertFloor(Floor floor) {
        return null;
    }
}
