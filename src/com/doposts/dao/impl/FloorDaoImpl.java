package com.doposts.dao.impl;

import com.doposts.Run;
import com.doposts.dao.Count;
import com.doposts.dao.CrudHandler;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.FloorDao;
import com.doposts.entity.Floor;
import com.doposts.vo.FloorWithReply;
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
    public List<Floor> getFloorByPostId(Integer postId, int offset, int pageSize) {
        Floor floor = new Floor();
        floor.setPostId(postId);
        floor.setIsDelete(false);
        try {
            return crud.select(Floor.class, floor, offset, pageSize);
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
            return count.getCount();
        }
        return 0;
    }

    /**
     *   插入楼正文
     * @param floor 楼所有数据
     * @return 返回插入后的主键ID
     */
    @Override
    public Integer insertFloor(Floor floor) {
        try {
            crud.insert(floor);
            floor.setSendDate(null);
            floor.setPostContent(null);
            floor.setImageUrl(null);
            floor.setIsDelete(null);
            List<Floor> floors = crud.select(Floor.class, floor);
            if(floors.size() == 1){
                return floors.get(0).getFloorId();
            }
            throw new RuntimeException();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 以id查询楼层信息
     *
     * @param id 主键
     * @return 实体类
     */
    @Override
    public FloorWithReply getFloorById(Integer id) {
        try {
            return crud.executeQueryToBean("SELECT\n" +
                    "\tfloor.*, \n" +
                    "\tcreateUser.userName AS createUserName\n" +
                    "FROM\n" +
                    "\tfloor\n" +
                    "\tLEFT JOIN\n" +
                    "\t`user` AS createUser\n" +
                    "\tON \n" +
                    "\t\tfloor.createUserId = createUser.userId\n" +
                    "WHERE\n" +
                    "\tfloor.floorId=?", FloorWithReply.class, id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据帖子id获取所有现有的楼层数
     *
     * @param postId 帖子id
     * @return 可显示楼层数
     */
    @Override
    public Integer getFloorCountByPostId(int postId) {
        Floor floor = new Floor();
        floor.setPostId(postId);
        floor.setIsDelete(false);
        try {
            return crud.selectCount(Floor.class, floor);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
