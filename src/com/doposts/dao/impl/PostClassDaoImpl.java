package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.PostClassDao;
import com.doposts.entity.PostClass;
import com.dxhualuo.database.impl.MySQL_C3P0;

/**
 *  帖子类型的实现
 * @author dx_hualuo
 */
public class PostClassDaoImpl extends MySQL_C3P0<PostClass> implements PostClassDao {
    public PostClassDaoImpl(){
        super("post");
    }

}
