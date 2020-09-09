package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.impl.ReplyDaoImpl;
import com.doposts.dao.interfaces.ReplyDao;
import com.doposts.entity.Floor;
import com.doposts.entity.Reply;
import com.doposts.service.interfaces.FloorService;
import com.doposts.utils.Page;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SelectAllPostAndFloor;
import com.mchange.v1.util.Sublist;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/20 15:19
 */
public class FloorServiceImpl  implements FloorService {
    /**
     * 用id获取正文
     *
     * @param postId 帖子id
     * @return 所有楼层信息
     */
    @Override
    public SelectAllPostAndFloor getFloorById(Integer postId,int pageIndex, int pageSize) {

        Page<FloorWithReply> page=new Page<>();
        page.setCurrPageNo(pageIndex);
        page.setPageSize(pageSize);
        page.setTotalCount(PostItDatabase.FLOOR_DAO.getFloorCountByPostId(postId));
        //创建一个加强类
        SelectAllPostAndFloor selectAllPostAndFloor=new SelectAllPostAndFloor();
        //拿到数据库返回楼层的数据
        page.setData(PostItDatabase.FLOOR_DAO.getFloorByPostId(postId,page.getOffSet(),page.getPageSize()));
        //拿到数据库返回的回复数据
        List<Reply> replyList=new ArrayList<>();
        //循环遍历把Floor里的数据转换到Floor加强类里
        for (FloorWithReply list: page.getData()) {
          //拿到每一楼的回复信息
            list.setReplyList(PostItDatabase.REPLY_DAO.getReplyListById(list.getFloorId()));
        }
        selectAllPostAndFloor.setFloor(page.getData());
        return selectAllPostAndFloor ;
    }

    /**
     * 通过postId获得当前帖子的最大楼数
     *
     * @param postId
     * @return 最大楼数
     */
    @Override
    public int getMaxFloorByPostId(Integer postId) {
        return PostItDatabase.FLOOR_DAO.getMaxFloorByPostId(postId);
    }

    /**
     * 插入楼正文
     *
     * @param floor 楼所有数据
     * @return 受影响的行数
     */
    @Override
    public FloorWithReply insertFloor(Floor floor) {
        Integer id = PostItDatabase.FLOOR_DAO.insertFloor(floor);
        if (id == 0) {
            return null;
        }
        return PostItDatabase.FLOOR_DAO.getFloorById(id);
    }

    /**
     * 根据帖子id获取所有现有的楼层数
     *
     * @param postId 帖子id
     * @return
     */
    @Override
    public Integer getFloorCountByPostId(int postId) {
        return PostItDatabase.FLOOR_DAO.getFloorCountByPostId(postId);
    }

    /**
     * 删除楼层
     *
     * @param postId  帖子id
     * @param floorId 楼id
     * @return
     */
    @Override
    public boolean deleteFloor(Integer postId, Integer floorId) {
        try {
            PostItDatabase.getCRUD().executeUpdate("DELETE FROM `reply` WHERE floorId = ?",floorId);
            return PostItDatabase.getCRUD().executeUpdate("DELETE FROM `floor` WHERE postId = ? AND postFloor = ?",postId,floorId) > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

}
