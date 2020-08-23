package com.doposts.service.interfaces;

import com.doposts.entity.Post;
import com.doposts.utils.Page;
import com.doposts.vo.PostQueryParam;
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

    /**
     * 根据条件获取帖子分页数据
     * @param queryParam 查询参数
     * @param pageIndex 当前页码
     * @param pageSize 显示数量
     * @return PageBean
     */
    Page<Post> getPostPageByCondition(PostQueryParam queryParam, Integer pageIndex, Integer pageSize);
}
