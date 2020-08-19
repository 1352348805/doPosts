package com.doposts.dao.interfaces;

import com.doposts.dao.entity.SuperPostClass;

import java.util.List;

/**
 *  帖子分类的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface PostClassDao {
    /**
     *  获得所有分类
     * @return SuperPostClass
     */
    List<SuperPostClass> getAllPostClass();

}
