package com.doposts.dao.entity;

import com.doposts.entity.User;
import com.dxhualuo.database.annotation.PrimaryKey;

import java.util.Date;
import java.util.List;

/**
 *  超级实体类，楼层实体
 * @author dx_hualuo
 */
@SuppressWarnings("unused")
public class SuperFloor {

    /**
     * 楼层id
     */
    public Integer floorId;

    /**
     * 所在的楼层
     */
    public Integer floorIndex;

    /**
     * 楼层正文
     */
    public String content;

    /**
     * 发送时间
     */
    public Date sendDate;

    /**
     * 图片地址
     */
    public String imageUrl;

    /**
     *  回复列表
     */
    public List<SuperReply> replyList;

    /**
     *  创建此楼的用户
     */
    public User createUser;
}
