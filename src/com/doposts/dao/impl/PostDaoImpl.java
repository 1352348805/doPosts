package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.PostDao;
import com.doposts.entity.Post;
import com.doposts.entity.PostClass;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.sql.SQLException;
import java.util.List;

/**
 *  帖子DAO的实现
 * @author dx_hualuo
 */
public class PostDaoImpl extends MySQL_C3P0<Post> implements PostDao {
    public PostDaoImpl(){
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
    }

    /**
     *  获得分类下某个下标开始指定数量的帖子
     * @param classId 分类Id
     * @param index 从第几个开始读
     * @param length 读的长度
     * @return List<Post>
     */
    @Override
    public List<Post> getPostPageByClassId(int classId, int index, int length) {
        try {
            return executeQueryToBeanList("SELECT * FROM `post` WHERE `postClassId`=? ORDER BY post.postId ASC LIMIT "+index+","+length, Post.class, classId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     *  获得分类下所有帖子
     * @param classId 分类Id
     * @return 所有帖子List<Post>
     */
    @Override
    public List<Post> getPostByClassId(int classId) {
        Post post = new Post();
        post.setPostClassId(classId);
        try {
            return select(Post.class, post);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 用id取帖子
     *
     * @param id 帖子id
     * @return Post
     */
    @Override
    public Post getPostById(Integer id) {
        Post post = new Post();
        post.setPostId(id);
        try {
            List<Post> postList = select(Post.class, post);
            if(postList.size() == 1){
                return postList.get(0);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
