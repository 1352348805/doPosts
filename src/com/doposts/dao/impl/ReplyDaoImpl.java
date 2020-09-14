package com.doposts.dao.impl;

import com.doposts.dao.Count;
import com.doposts.dao.CrudHandler;
import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.ReplyDao;
import com.doposts.entity.Floor;
import com.doposts.entity.Post;
import com.doposts.entity.Reply;
import com.doposts.vo.SuperReply;
import com.dxhualuo.database.handler.base.SuperCrudHandler;
import com.dxhualuo.database.handler.interfaces.DatabaseCrud;
import com.dxhualuo.database.handler.interfaces.SuperCrud;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 *  回复的消息DAO的实现
 * @author dx_hualuo
 */
public class ReplyDaoImpl implements ReplyDao {
    SuperCrud<Reply> crud;
    DatabaseCrud basicCrud;

    public ReplyDaoImpl(){
        this.crud = CrudHandler.replyCrud;
        this.basicCrud = PostItDatabase.getCRUD();
    }

    /**
     * 获取所有回复信息
     *
     * @param floorId 楼层ID
     * @return 回复信息
     */
    @Override
    public List<SuperReply> getReplyListById(Integer floorId) {
        try {
            return crud.executeQueryToBeanList("    SELECT\n" +
                    "        reply.*,\n" +
                    "        `replyUser`.userName AS replyUserName,\n" +
                    "        `replyUser`.favicon AS replyFavicon,\n" +
                    "        `repliedUser`.`userName` AS repliedUserName,\n" +
                    "        `repliedUser`.`favicon` AS repliedFavicon \n" +
                    "    FROM\n" +
                    "        reply   \n" +
                    "    LEFT JOIN\n" +
                    "        `user` replyUser  \n" +
                    "            ON   (\n" +
                    "                reply.replyUserId = `replyUser`.userId\n" +
                    "            ) \n" +
                    "    LEFT JOIN\n" +
                    "        `user` repliedUser  \n" +
                    "            ON (\n" +
                    "                reply.`repliedUserId` = repliedUser.userId\n" +
                    "            )  \n" +
                    "    WHERE\n" +
                    "        reply.floorId = ?", SuperReply.class, floorId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 评论回复
     *
     * @param reply 回复数据
     * @return 返回Id
     */
    @Override
    public Integer insertReply(Reply reply) {
        DatabaseCrud transactionCrud = basicCrud.getTransactionCrud();
        try {
            if(new SuperCrudHandler<>(transactionCrud).insert(reply) == 1){
                ResultSet rs = transactionCrud.executeQuery("select @@IDENTITY");
                if(rs.next()){
                    return rs.getInt(1);
                }
                throw new RuntimeException();
            }
            throw new RuntimeException("插入失败！受影响行数为0！");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            transactionCrud.getConnectionManager().closeConnection();
        }
    }

    /**
     * 用id获取正文
     *
     * @param FloorId  楼层id
     * @param offset 从第几个开始
     * @param pageSize 查几个
     * @return 所有楼层信息
     */
    @Override
    public List<SuperReply> getReplyByFloorId(Integer FloorId, int offset, int pageSize) {
        try {
            return crud.executeQueryToBeanList("SELECT\n" +
                    "\treply.*, \n" +
                    "\treplyUser.userName AS replyUserName, \n" +
                    "\trepliedUser.userName AS repliedUserName, \n" +
                    "\treplyUser.favicon AS replyFavicon, \n" +
                    "\trepliedUser.favicon AS repliedFavicon\n" +
                    "FROM\n" +
                    "\treply AS reply\n" +
                    "\tLEFT JOIN\n" +
                    "\t`user` AS replyUser\n" +
                    "\tON \n" +
                    "\t\treply.replyUserId = replyUser.userId\n" +
                    "\tLEFT JOIN\n" +
                    "\t`user` AS repliedUser\n" +
                    "\tON \n" +
                    "\t\treply.repliedUserId = repliedUser.userId\n" +
                    "WHERE\n" +
                    "\treply.floorId = ?\n" +
                    "LIMIT ?, ?", SuperReply.class, FloorId, offset, pageSize);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据帖子id获取所有现有的回复数
     *
     * @param FloorId 帖子id
     * @return 数量
     */
    @Override
    public Integer getReplyCountByFloorId(int FloorId) {
        Reply reply = new Reply();
        reply.setFloorId(FloorId);
        try {
            return crud.selectCount(Reply.class, reply);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Integer deleteReplyByUserId(int id) {
        Reply reply = new Reply();
        reply.setReplyUserId(id);
        try {
            return crud.delete(reply);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
