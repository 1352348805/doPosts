package com.doposts.dao.interfaces;

import com.doposts.entity.Floor;

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
    List<Floor> getFloorByPostId(Integer postId);
}
