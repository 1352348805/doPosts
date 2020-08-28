package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.monitor.DatabaseMonitorServlet;
import com.doposts.entity.Post;
import com.doposts.entity.PostClass;
import com.doposts.service.impl.PostServiceImpl;
import com.doposts.service.interfaces.PostService;
import com.doposts.vo.PostInfo;
import com.doposts.vo.PostQueryParam;

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
        PostService postService = new PostServiceImpl();
        List<Post> list = postService.selectThreeLevelClassPostList(60);
        System.out.println(list.get(0));
        PostItDatabase.POST_DAO.getPostByClassId(1);
    }
}