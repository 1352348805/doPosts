package com.doposts.dao.impl;

import com.doposts.dao.CrudHandler;
import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.ReplyDao;
import com.doposts.entity.Post;
import com.doposts.entity.Reply;
import com.dxhualuo.database.handler.interfaces.DatabaseCrud;
import com.dxhualuo.database.handler.interfaces.SuperCrud;

import java.sql.SQLException;
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
    public List<Reply> getReplyListById(Integer floorId) {
        Reply reply = new Reply();
        reply.setFloorId(floorId);
        try {
            return crud.select(Reply.class, reply);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
