package com.doposts.dao.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.entity.SuperPost;
import com.doposts.dao.interfaces.PostDao;
import com.doposts.entity.Post;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.sql.SQLException;
import java.util.List;

/**
 *  帖子DAO的实现
 * @author dx_hualuo
 */
public class PostDaoImpl extends MySQL_C3P0<Post> implements PostDao {
    public PostDaoImpl(){
        super("post");
    }

}
