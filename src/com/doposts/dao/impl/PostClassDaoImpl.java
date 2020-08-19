package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.PostClassDao;
import com.doposts.entity.PostClass;
import com.dxhualuo.database.impl.MySQL_C3P0;
import java.sql.SQLException;
import java.util.List;

/**
 *  帖子类型的实现
 * @author dx_hualuo
 */
public class PostClassDaoImpl extends MySQL_C3P0<PostClass> implements PostClassDao {
    public PostClassDaoImpl(){
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
    }

    /**
     *  获得一级分类
     * @return SuperPostClass
     */
    @Override
    public List<PostClass> getOneLevelPostClass() {
        PostClass ps = new PostClass();
        ps.setClassLevel(1);
        try {
            return select(PostClass.class, ps);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获得一个分类的子分类
     * @param postClass 分类
     * @return 子分类列表
     */
    @Override
    public List<PostClass> getSubPostClass(PostClass postClass) {
        if(postClass != null){
            PostClass ps = new PostClass();
            ps.setClassLevel(postClass.getClassLevel() + 1);
            ps.setClassFatherId(postClass.getClassId());
            try {
                return select(PostClass.class, ps);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
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
        PostClass ps = new PostClass();
        ps.setClassId(id);
        try {
            List<PostClass> postClasses = select(PostClass.class, ps);
            if(postClasses.size() == 1){
                return postClasses.get(0);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
