package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.impl.PostDaoImpl;
import com.doposts.entity.Post;
import com.dxhualuo.database.Database;


public class Run {
    public static void main(String[] args) throws Exception{
        Post post = new Post();
        post.setPostId(1);
        Database<Post> ds = (PostDaoImpl)PostItDatabase.POST_DAO;
        ds.select(Post.class, post);
    }
}