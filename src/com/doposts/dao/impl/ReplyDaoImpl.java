package com.doposts.dao.impl;

import com.doposts.Run;
import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.ReplyDao;
import com.doposts.entity.Reply;
import com.dxhualuo.database.impl.MySQL_C3P0;

import java.sql.SQLException;
import java.util.List;

/**
 *  回复的消息DAO的实现
 * @author dx_hualuo
 */
public class ReplyDaoImpl extends MySQL_C3P0<Reply> implements ReplyDao {
    public ReplyDaoImpl(){
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
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
            return select(Reply.class, reply);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
