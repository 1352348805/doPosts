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
        String url = "c:/1.jpg;d:/2.jpg;f:/3.jpg";
        String[] str = url.split(";");
        for (String item: str
             ) {
            System.out.println(item);
        }
    }
}