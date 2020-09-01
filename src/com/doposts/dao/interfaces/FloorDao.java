package com.doposts.dao.interfaces;

import com.doposts.entity.Floor;
import com.doposts.vo.FloorWithReply;

import java.util.List;

/**
 *  楼层的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface FloorDao {
    /**
     *  用id获取正文
     * @param postId 帖子id
     * @return 所有楼层信息
     */
    List<FloorWithReply> getFloorByPostId(Integer postId,int offset,int pageSize);

    /**
     *  通过postId获得当前帖子的最大楼数
     * @return 最大楼数
     */
   int getMaxFloorByPostId(Integer postId);

    /**
     *   插入楼正文
     * @param floor 楼所有数据
     * @return 返回插入后的主键
     */
    Integer insertFloor(Floor floor);

    /**
     * 以id查询楼层信息
     * @param id 主键
     * @return  实体类
     */
    FloorWithReply getFloorById(Integer id);

    /**
     * 根据帖子id获取所有现有的楼层数
     *
     * @param postId 帖子id
     * @return
     */
    Integer getFloorCountByPostId(int postId);
}