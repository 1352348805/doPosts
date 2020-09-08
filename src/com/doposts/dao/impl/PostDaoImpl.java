package com.doposts.dao.impl;

import com.doposts.dao.CrudHandler;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.PostDao;
import com.doposts.entity.Post;
import com.doposts.vo.PostInfo;
import com.doposts.vo.PostQueryParam;
import com.doposts.vo.SuperPost;
import com.dxhualuo.database.handler.interfaces.DatabaseCrud;
import com.dxhualuo.database.handler.interfaces.SuperCrud;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *  帖子DAO的实现
 * @author dx_hualuo
 */
public class PostDaoImpl implements PostDao {
    SuperCrud<Post> crud;
    DatabaseCrud basicCrud;

    /**
     * 通过一个连接管理器创建一个CRUD处理器
     *
     */
    public PostDaoImpl() {
        this.crud = CrudHandler.postCrud;
        this.basicCrud = PostItDatabase.getCRUD();
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
            return crud.executeQueryToBeanList("SELECT * FROM `post` WHERE `postClassLevel3Id`=? ORDER BY post.postId ASC LIMIT "+index+","+length, Post.class, classId);
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
        post.setPostClassLevel3Id(classId);
        try {
            return crud.select(Post.class, post);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    /**
     * 用id取帖子
     *
     * @param id 帖子id
     * @return SuperPost
     */
    @Override
    public SuperPost getSuperPostById(Integer id) {
        try {
            return crud.executeQueryToBean("SELECT\n" +
                    "\tpost.*, \n" +
                    "\t`user`.userName AS createUserName\n," +
                    "\t`user`.favicon AS createFavicon\n" +
                    "FROM\n" +
                    "\tpost\n" +
                    "\tLEFT JOIN\n" +
                    "\t`user`\n" +
                    "\tON \n" +
                    "\t\tpost.createUserId = `user`.userId\n" +
                    "WHERE\n" +
                    "\tpost.postId = ?", SuperPost.class, id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 按条件分页查询帖子
     *
     * @param postQueryParam 查询条件,属性值为空的字段不参与查询
     * @param offset         偏移量
     * @param size           查询数量
     * @return PostInfo集合
     */
    @Override
    public List<PostInfo> getPostListByCondition(PostQueryParam postQueryParam, int offset, int size) {
        StringBuilder builder = new StringBuilder(
                "SELECT\n" +
                "\tpost.*, \n" +
                "\tcreateUser.userName AS createUserName, \n" +
                "\tlv1.className AS postClassLevel1Name, \n" +
                "\tlv2.className AS postClassLevel2Name, \n" +
                "\tlv3.className AS postClassLevel3Name\n" +
                "FROM\n" +
                "\tpost\n" +
                "\tLEFT JOIN\n" +
                "\t`user` AS createUser\n" +
                "\tON \n" +
                "\t\tpost.createUserId = createUser.userId\n" +
                "\tLEFT JOIN\n" +
                "\tpost_classification AS lv1\n" +
                "\tON \n" +
                "\t\tlv1.classId = post.postClassLevel1Id\n" +
                "\tLEFT JOIN\n" +
                "\tpost_classification AS lv2\n" +
                "\tON \n" +
                "\t\tlv2.classId = post.postClassLevel2Id\n" +
                "\tLEFT JOIN\n" +
                "\tpost_classification AS lv3\n" +
                "\tON \n" +
                "\t\tlv3.classId = post.postClassLevel3Id\n" +
                "WHERE\n");
        ArrayList<Object> para = new ArrayList<>();
        if(postQueryParam.getPostName() != null){
            builder.append("\tpost.postName LIKE CONCAT('%',?,'%') AND\n");
            para.add(postQueryParam.getPostName());
        }
        if(postQueryParam.getCreateUserName() != null){
            builder.append("\tcreateUser.userName = ? AND\n");
            para.add(postQueryParam.getCreateUserName());
        }
        if(postQueryParam.getPostClassLevel1Id() != null){
            builder.append("post.postClassLevel1Id = ?\n");
            para.add(postQueryParam.getPostClassLevel1Id());
        }else if(postQueryParam.getPostClassLevel2Id() != null){
            builder.append("post.postClassLevel2Id = ?\n");
            para.add(postQueryParam.getPostClassLevel2Id());
        }else if(postQueryParam.getPostClassLevel3Id() != null){
            builder.append("post.postClassLevel3Id = ?\n");
            para.add(postQueryParam.getPostClassLevel3Id());
        }else if(para.size() > 0){
            builder.delete(builder.length()-5,builder.length());
        }
        if(para.size() == 0){
            builder.delete(builder.length()-7,builder.length());
        }
        builder.append(" LIMIT ?, ?");
        para.add(offset);
        para.add(size);
        try {
            return crud.executeQueryToBeanList(builder.toString(), PostInfo.class, para.toArray());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据id删除帖子
     *
     * @param id 主键
     * @return 受影响的行数
     */
    @Override
    public Integer deletePostById(int id) {
        Post post = new Post();
        post.setPostId(id);
        try {
            return crud.delete(post);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 添加帖子
     *
     * @param post 实体
     * @return 受影响的行数
     */
    @Override
    public Integer insertPost(Post post) {
        try {
            return crud.insert(post);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 修改帖子
     *
     * @param post 实体
     * @return 受影响的行数
     */
    @Override
    public Integer updatePostById(Post post) {
        try {
            return crud.update(post);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据条件获取记录数
     *
     * @param postQueryParam 查询条件,属性值为空的字段不参与查询
     * @return 记录数
     */
    @Override
    public Integer getPostCountByCondition(PostQueryParam postQueryParam) {
        StringBuilder builder = new StringBuilder("SELECT\n" +
                "\tCOUNT(*) as count\n"+
                "FROM\n" +
                "\tpost\n" +
                "\tLEFT JOIN\n" +
                "\t`user` AS createUser\n" +
                "\tON \n" +
                "\t\tpost.createUserId = createUser.userId\n" +
                "\tLEFT JOIN\n" +
                "\tpost_classification AS lv1\n" +
                "\tON \n" +
                "\t\tlv1.classId = post.postClassLevel1Id\n" +
                "\tLEFT JOIN\n" +
                "\tpost_classification AS lv2\n" +
                "\tON \n" +
                "\t\tlv2.classId = post.postClassLevel2Id\n" +
                "\tLEFT JOIN\n" +
                "\tpost_classification AS lv3\n" +
                "\tON \n" +
                "\t\tlv3.classId = post.postClassLevel3Id\n" +
                "WHERE\n");
        ArrayList<Object> para = new ArrayList<>();
        if(postQueryParam.getPostName() != null){
            builder.append("\tpost.postName LIKE CONCAT('%',?,'%') AND\n");
            para.add(postQueryParam.getPostName());
        }
        if(postQueryParam.getCreateUserName() != null){
            builder.append("\tcreateUser.userName = ? AND\n");
            para.add(postQueryParam.getCreateUserName());
        }
        if(postQueryParam.getPostClassLevel1Id() != null){
            builder.append("post.postClassLevel1Id = ?\n");
            para.add(postQueryParam.getPostClassLevel1Id());
        }else if(postQueryParam.getPostClassLevel2Id() != null){
            builder.append("post.postClassLevel2Id = ?\n");
            para.add(postQueryParam.getPostClassLevel2Id());
        }else if(postQueryParam.getPostClassLevel3Id() != null){
            builder.append("post.postClassLevel3Id = ?\n");
            para.add(postQueryParam.getPostClassLevel3Id());
        }else if(para.size() > 0){
            builder.delete(builder.length()-5,builder.length());
        }
        if(para.size() == 0){
            builder.delete(builder.length()-7,builder.length());
        }
        try {
            ResultSet count = basicCrud.executeQueryByArrayParameter(builder.toString(), para.toArray());
            if(count.next()){
                int c = count.getInt("count");
                count.close();
                return c;
            }
            throw new RuntimeException();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Integer addPostWatchCount(Integer postId) {
        try {
            return basicCrud.executeUpdate("UPDATE `post` SET  `watchCount`=`watchCount`+1  WHERE `postId`=?",postId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Integer addPostReplyConut(Integer postId) {
        try {
            return basicCrud.executeUpdate("UPDATE `post` SET  `PostReplyCount`=`PostReplyCount`+1  WHERE `postId`=?",postId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
