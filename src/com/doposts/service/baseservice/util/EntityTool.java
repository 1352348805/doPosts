package com.doposts.service.baseservice.util;

import com.doposts.dao.entity.SuperFloor;
import com.doposts.dao.entity.SuperPost;
import com.doposts.dao.entity.SuperReply;
import com.doposts.entity.Post;
import com.doposts.entity.User;
import com.dxhualuo.database.Database;

import java.sql.ResultSet;
import java.time.LocalDateTime;

/**
 *  将数据包装进超级实体类
 * @author dx_hualuo
 */
public class EntityTool {
    /**
     *  将读取出来的数据开始封装进超级实体类
     * @param post post普通实体类
     * @param database 数据库
     * @return 超级实体类
     */
    public static SuperPost getSuperPost(Post post, Database<?> database){
        return null;
    }

    public static SuperFloor getSuperFloor(){
        return null;
    }
    public static SuperReply getSuperReply(){
        return null;
    }

    public static User getUser(){
        return null;
    }
}
