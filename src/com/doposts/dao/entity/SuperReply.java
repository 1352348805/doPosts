package com.doposts.dao.entity;

import com.doposts.entity.User;
import com.dxhualuo.database.annotation.PrimaryKey;
import java.util.Date;

/**
 *  超级实体类，回复的消息
 * @author dx_hualuo
 */
@SuppressWarnings("unused")
public class SuperReply {
    /**
     * 回复的绝对id
     */
    @PrimaryKey
    public Integer replyId;

    /**
     * 回复正文
     */
    public String content;

    /**
     * 正在回复的用户
     */
    public User replyUser;

    /**
     * 被回复的用户Id
     */
    public User repliedUser;

    /**
     * 回复的时间
     */
    public Date date;

    /**
     * 回复时使用的图片地址
     */
    public String imageUrl;
}
