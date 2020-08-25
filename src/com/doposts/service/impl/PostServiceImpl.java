package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.Post;
import com.doposts.service.interfaces.PostService;
import com.doposts.utils.Page;
import com.doposts.vo.PostInfo;
import com.doposts.vo.PostQueryParam;

import java.util.List;

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
    public Page<PostInfo> getPostPageByCondition(PostQueryParam queryParam, Integer pageIndex, Integer pageSize) {
        Page<PostInfo> page = new Page<>();
        Integer count = PostItDatabase.POST_DAO.getPostCountByCondition(queryParam);
        page.setTotalCount(count);
        page.setCurrPageNo(pageIndex);
        page.setPageSize(pageSize);
        int offset = page.getOffSet();
        List<PostInfo> posts = PostItDatabase.POST_DAO.getPostListByCondition(queryParam, offset, pageSize);
        page.setData(posts);
        return page;
    }

    /**
     * 添加帖子
     *
     * @param post 实体
     * @return 是否添加成功
     */
    @Override
    public boolean addPost(Post post) {
        return PostItDatabase.POST_DAO.insertPost(post) > 0;
    }

    /**
     * 根据id修改帖子
     *
     * @param post 实体
     * @return 是否修改成功
     */
    @Override
    public boolean modifyPostById(Post post) {
        return PostItDatabase.POST_DAO.updatePostById(post) > 0;
    }

    /**
     * 根据id删除帖子
     *
     * @param id id 主键
     * @return 是否删除成功
     */
    @Override
    public boolean deletePostById(int id) {
        return PostItDatabase.POST_DAO.deletePostById(id) > 0;
    }

    /**
     * 根据查询参数获取总记录数
     *
     * @param queryParam 查询条件
     * @return 记录数
     */
    @Override
    public Integer getPostCountByCondition(PostQueryParam queryParam) {
        return PostItDatabase.POST_DAO.getPostCountByCondition(queryParam);
    }
}
