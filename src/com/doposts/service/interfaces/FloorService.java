package com.doposts.service.interfaces;

import com.doposts.entity.Floor;
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
    SelectAllPostAndFloor getFloorById(Integer PostId);
}
