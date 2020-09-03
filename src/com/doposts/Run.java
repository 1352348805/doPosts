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
        System.out.println(PostItDatabase.getCRUD().executeUpdate("UPDATE `post` SET  `watchCount`=`watchCount`+1  WHERE `postId`=?",3));
    }
}