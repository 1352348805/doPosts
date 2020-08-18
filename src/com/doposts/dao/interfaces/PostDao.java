package com.doposts.dao.interfaces;

import com.doposts.dao.entity.SuperPost;

/**
 *  帖子的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface PostDao {
    /**
     *  获得一个递归实体类
     * @param id id
     * @return SuperPost
     */
    SuperPost getPostById(Integer id);


}
