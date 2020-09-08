package com.doposts;

import com.doposts.dao.CrudHandler;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.monitor.DatabaseMonitorServlet;
import com.doposts.entity.Reply;
import com.doposts.vo.SuperPost;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
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
//        System.out.println(PostItDatabase.getCRUD().executeUpdate("UPDATE `post` SET  `watchCount`=`watchCount`+1  WHERE `postId`=?",3));
//          String url = "action=postAndfloor&postid=8&pageindex=2&pageSize=10";
//          String[] list =url.split("&");
//        for (int i=0;i<list.length;i++) {
//            String[] x = list[i].split("=");
//            if(x[0].equals("pageindex")){
//                System.out.println(x[1]);
//            }
//            System.out.println(list[i]);
//        }


         Object oo = new Object() ;
        System.out.println(oo);
        System.out.println(oo = new Object());

    }
}