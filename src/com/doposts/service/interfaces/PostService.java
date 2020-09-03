package com.doposts.service.interfaces;

import com.doposts.entity.Post;
import com.doposts.utils.Page;
import com.doposts.vo.PostInfo;
import com.doposts.vo.PostQueryParam;
import com.doposts.vo.SelectAllPostAndFloor;
import com.doposts.vo.SuperPost;

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
    SuperPost getPostById(Integer id);

    /**
     * 根据条件获取帖子分页数据
     * @param queryParam 查询参数
     * @param pageIndex 当前页码
     * @param pageSize 显示数量
     * @return PageBean
     */
    Page<PostInfo> getPostPageByCondition(PostQueryParam queryParam, Integer pageIndex, Integer pageSize);

    /**
     * 添加帖子
     * @param post 实体
     * @return 是否添加成功
     */
    boolean addPost(Post post);

    /**
     * 根据id修改帖子
     * @param post 实体
     * @return 是否修改成功
     */
    boolean modifyPostById(Post post);

    /**
     * 根据id删除帖子
     * @param id id 主键
     * @return 是否删除成功
     */
    boolean deletePostById(int id);

    /**
     * 根据查询参数获取总记录数
     * @param queryParam 查询条件
     * @return 记录数
     */
    Integer getPostCountByCondition(PostQueryParam queryParam);

    /**
     *@Description 根据三级分类id条件查询帖子
     *@Param postClassLevelThreeId
     *@Author Wang.li.ming
     *@Date 2020/8/27
     *@Time 19:19
     */
    List<Post> selectThreeLevelClassPostList(Integer postClassLevelThreeId);

}
