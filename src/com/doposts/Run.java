package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.monitor.DatabaseMonitorServlet;
import com.doposts.entity.Post;
import com.doposts.entity.PostClass;
import com.doposts.entity.User;
import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.interfaces.PostClassService;

import java.util.List;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
//        DatabaseMonitorServlet monitorServlet = new DatabaseMonitorServlet();
//        monitorServlet.init();
//        PostItDatabase.FLOOR_DAO.getFloorCountByPostId(1);
        PostClassService postClassService = new PostClassServiceImpl();
        List<PostClass> list= postClassService.getPostClassByIdWithParents(60);
        for(int i =0 ;i < list.size();i++ ){
            System.out.println(list.get(i).getClassId());
        }




    }
}