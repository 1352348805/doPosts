package com.doposts.dao.interfaces;

import com.doposts.dao.entity.SuperPostClass;
import com.doposts.entity.PostClass;

import java.util.List;

/**
 *  帖子分类的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface PostClassDao {
    /**
     *  获得一级分类
     * @return SuperPostClass
     */
    List<PostClass> getOneLevelPostClass();

    /**
     *  获得一个分类的子分类
     * @param postClass 分类
     * @return 子分类列表
     */
    List<PostClass> getSubPostClass(PostClass postClass);

    /**
     *  获得指定Id的分类
     * @param id id
     * @return 分类
     */
    PostClass getPostClassById(int id);
}
