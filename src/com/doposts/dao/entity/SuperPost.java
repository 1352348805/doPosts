package com.doposts.dao.entity;

import com.doposts.entity.User;
import com.dxhualuo.database.annotation.PrimaryKey;

import java.util.Date;
import java.util.List;

/**
 *  超级实体类，帖子详情
 * @author dx_hualuo
 */
@SuppressWarnings("unused")
public class SuperPost {
    /**
     * 帖子id
     */
    @PrimaryKey
    public Integer postId;

    /**
     * 帖子名字
     */
    public String postName;

    /**
     * 帖子分类
     */
    public SuperPostClass postClass;

    /**
     * 创建者
     */
    public User createUser;

    /**
     * 创建时间
     */
    public Date createDate;

    /**
     *  楼层列表
     */
    public List<SuperFloor> floors;
}
