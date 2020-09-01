package com.doposts;

import com.doposts.dao.CrudHandler;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.monitor.DatabaseMonitorServlet;
import com.doposts.entity.Reply;

import java.util.Date;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
        DatabaseMonitorServlet monitorServlet = new DatabaseMonitorServlet();
        monitorServlet.init();
        Reply reply = new Reply();
        reply.setReplyUserId(1);
        reply.setRepliedUserId(4);
        reply.setReplyContent("逍遥君！");
        reply.setReplyDate(new Date());
        reply.setFloorId(1);
        PostItDatabase.REPLY_DAO.insertReply(reply);
    }
}