package com.doposts.dao.impl;

import com.doposts.Run;
import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.PostClassDao;
import com.doposts.entity.PostClass;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.sql.ResultSet;
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

    /**
     * 删除指定id的分类
     * @param id id
     * @return 受影响的行数
     */
    @Override
    public Integer deletePostClassById(int id) {
        PostClass postClass = new PostClass();
        postClass.setClassId(id);
        try {
            return delete(postClass);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 以分类id获取其子分类的记录数
     * @param id id
     * @return 记录数
     */
    @Override
    public Integer getPostClasschildrenCountById(int id) {
        try {
            PostClass postClass = new PostClass();
            postClass.setClassFatherId(id);
            return selectCount(PostClass.class, postClass);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 插入分类记录
     * @param postClass 插入的实体
     * @return 受影响的行数
     */
    @Override
    public Integer insertPostClass(PostClass postClass) {
        try {
            return insert(postClass);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询分类名相同的记录
     * @param className 要查询的分类名
     * @return 实体类
     */
    @Override
    public PostClass findPostClassByClassName(String className) {
        PostClass postClass = new PostClass();
        postClass.setClassName(className);
        try {
            List<PostClass> postClassList = select(PostClass.class, postClass);
            if(postClassList != null && postClassList.size() == 1){
                return postClassList.get(0);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 以id更新分类
     *
     * @param postClass 分类实体，其中属性值为空的字段无需参与更新
     * @return 受影响的行数
     */
    @Override
    public Integer updatePostClassById(PostClass postClass) {
        try {
            return update(postClass);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据分类名和分类等级模糊查询分类列表
     * @param className  查询的分类名
     * @param classLevel 查询的分类等级
     * @return 分类集合
     */
    @Override
    public List<PostClass> getPostClassListByCondition(String className, int classLevel) {
        PostClass like = new PostClass();
        PostClass same = new PostClass();
        like.setClassName(className);
        same.setClassLevel(classLevel);
        try {
            return selectLikeAndSame(PostClass.class, like, same);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
