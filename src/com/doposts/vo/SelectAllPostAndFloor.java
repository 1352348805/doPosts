package com.doposts.vo;

import com.doposts.entity.Floor;
import com.doposts.entity.Post;

import java.util.Date;
import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/20 14:07
 */
public class SelectAllPostAndFloor extends Post {


    /**
     *  帖子楼层里的信息
     */
    private List<FloorWithReply> floor;


    public List<FloorWithReply> getFloor() {
        return floor;
    }

    public void setFloor(List<FloorWithReply> floor) {
        this.floor = floor;
    }
}
