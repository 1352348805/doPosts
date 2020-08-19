package com.doposts.dao.interfaces;

import com.doposts.entity.Post;
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
}
