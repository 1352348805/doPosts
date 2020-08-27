package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.monitor.DatabaseMonitorServlet;
import com.doposts.entity.Floor;
import com.doposts.entity.PostClass;
import com.doposts.vo.PostInfo;
import com.doposts.vo.PostQueryParam;

import java.util.Date;
import java.util.List;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
        DatabaseMonitorServlet monitorServlet = new DatabaseMonitorServlet();
        monitorServlet.init();
        Floor floor = new Floor();
        floor.setCreateUserId(28);
        floor.setPostContent("测试结束！");
        floor.setSendDate(new Date());
        floor.setPostFloor(46);
        floor.setPostId(1);
        PostItDatabase.FLOOR_DAO.insertFloor(floor);
    }
}