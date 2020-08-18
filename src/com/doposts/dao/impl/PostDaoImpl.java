package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.entity.SuperPost;
import com.doposts.dao.interfaces.PostDao;
import com.doposts.dao.tools.ProcessingTable;
import com.doposts.entity.Post;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.sql.SQLException;
import java.util.List;

/**
 *  帖子DAO的实现
 * @author dx_hualuo
 */
public class PostDaoImpl extends MySQL_C3P0<Post> implements PostDao {
    public PostDaoImpl(){
        super("post");
    }

    @Override
    public SuperPost getPostById(Integer id) {
        Post post = new Post();
        post.setPostId(id);
        try{
            List<Post> postList = select(Post.class, post);
            if(postList.size() == 1){
                return ProcessingTable.getSuperPost(postList.get(0), (FloorDaoImpl)PostItDatabase.FLOOR_DAO);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return null;
    }
}
