package com.doposts.dao.impl;

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
    public List<PostClass> getOneLevelPostClass() {
        SuperPostClass superPostClass = new SuperPostClass();
        List<PostClass> postClassList = select(PostClass.class);

        return null;
    }

    /**
     * 获得一个分类的子分类
     *
     * @param postClass 分类
     * @return 子分类列表
     */
    @Override
    public List<PostClass> getSubPostClass(PostClass postClass) {
        return null;
    }

    /**
     * 获得指定Id的分类
     *
     * @param id id
     * @return 分类
     */
    @Override
    public PostClass getPostClassById(int id) {
        return null;
    }

    private SuperPostClass getSuperPostClass(SuperPostClass postClass){
        return null;
    }
}
