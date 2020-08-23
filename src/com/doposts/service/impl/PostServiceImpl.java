package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.Post;
import com.doposts.service.interfaces.PostService;
import com.doposts.utils.Page;
import com.doposts.vo.PostQueryParam;

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

    /**
     * 根据条件获取帖子分页数据
     *
     * @param queryParam 查询参数
     * @param pageIndex  当前页码
     * @param pageSize   显示数量
     * @return PageBean
     */
    @Override
    public Page<Post> getPostPageByCondition(PostQueryParam queryParam, Integer pageIndex, Integer pageSize) {
        return null;
    }
}
