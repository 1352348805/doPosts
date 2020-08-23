package com.doposts.dao.interfaces;

import com.doposts.entity.Floor;
import com.doposts.entity.Post;
import com.doposts.vo.PostInfo;
import com.doposts.vo.PostQueryParam;

import java.util.List;

/**
 *  帖子的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface PostDao {
    /**
     *  获得分类下某个下标开始指定数量的帖子
     * @param classId 分类Id
     * @param index 从第几个开始读
     * @param length 读的长度
     * @return List<Post>
     */
    List<Post> getPostPageByClassId(int classId, int index, int length);

    /**
     *  获得分类下所有帖子
     * @param classId 分类Id
     * @return 所有帖子List<Post>
     */
    List<Post> getPostByClassId(int classId);

    /**
     * 用id取帖子
     * @param id 帖子id
     * @return Post
     */
    Post getPostById(Integer id);

    /**
     * 按条件分页查询帖子
     * @param postQueryParam 查询条件,属性值为空的字段不参与查询
     * @param offset 偏移量
     * @param size  查询数量
     * @return PostInfo集合
     */
    List<PostInfo> getPostListByCondition(PostQueryParam postQueryParam,
                                          int offset,
                                          int size);

    /**
     * 根据id删除帖子
     * @param id 主键
     * @return 受影响的行数
     */
    Integer deletePostById(int id);

    /**
     * 添加帖子
     * @param post 实体
     * @return 受影响的行数
     */
    Integer insertPost(Post post);

    /**
     * 修改帖子
     * @param post 实体
     * @return 受影响的行数
     */
    Integer updatePostById(Post post);

    /**
     * 根据条件获取记录数
     * @param postQueryParam 查询条件,属性值为空的字段不参与查询
     * @return 记录数
     */
    Integer getPostCountByCondition(PostQueryParam postQueryParam);

}
