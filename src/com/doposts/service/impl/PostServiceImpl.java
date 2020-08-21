package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.Post;
import com.doposts.service.interfaces.PostService;

/**
 * @author xiao yao
 * @date 2020/8/20 15:19
 */
public class PostServiceImpl  implements PostService {
    /**
     * 用id取帖子
     *
     * @param id 帖子id
     * @return Post
     */
    @Override
    public Post getPostById(Integer id) {
       Post post= PostItDatabase.POST_DAO.getPostById(id);
        return post;
    }
}
