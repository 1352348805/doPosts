package com.doposts.service.interfaces;

import com.doposts.entity.Post;
import com.doposts.vo.SelectAllPostAndFloor;

import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/20 15:17
 */
public interface PostService {
    /**
     * 用id取帖子
     * @param id 帖子id
     * @return Post
     */
    Post getPostById(Integer id);

}
