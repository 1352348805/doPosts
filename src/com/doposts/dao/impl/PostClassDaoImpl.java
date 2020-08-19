package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.entity.SuperPostClass;
import com.doposts.dao.interfaces.PostClassDao;
import com.doposts.entity.PostClass;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.util.List;

/**
 *  帖子类型的实现
 * @author dx_hualuo
 */
public class PostClassDaoImpl extends MySQL_C3P0<PostClass> implements PostClassDao {
    public PostClassDaoImpl(){
        super("post");
    }

    @Override
    public List<SuperPostClass> getAllPostClass() {
        SuperPostClass superPostClass = new SuperPostClass();
        List<PostClass> postClassList = select(PostClass.class);

        return null;
    }

    private SuperPostClass getSuperPostClass(SuperPostClass postClass){
        return null;
    }
}
