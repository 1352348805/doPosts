package com.doposts.service.interfaces;

import com.doposts.entity.Floor;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SelectAllPostAndFloor;

import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/20 15:18
 */
public interface FloorService {
    /**
     *  用id获取正文
     * @param PostId 帖子id
     * @return 所有楼层信息
     */
    SelectAllPostAndFloor getFloorById(Integer PostId,int pageIndex, int pageSize);
    /**
     *  通过postId获得当前帖子的最大楼数
     * @return 最大楼数
     */
    int getMaxFloorByPostId(Integer postId);
    /**
     *   插入楼正文
     * @param floor 楼所有数据
     * @return 受影响的行数
     */
    FloorWithReply insertFloor(Floor floor);

    /**
     * 根据帖子id获取所有现有的楼层数
     * @param postId 帖子id
     * @return 数量
     */
    Integer getFloorCountByPostId(int postId);

    /**
     * 删除楼层
     * @param postId 帖子id
     * @param floorId 楼id
     * @return
     */
    boolean deleteFloor(Integer postId, Integer floorId);
}
