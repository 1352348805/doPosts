package com.doposts.servlet;

import com.alibaba.druid.sql.dialect.sqlserver.visitor.MSSQLServerExportParameterVisitor;
import com.doposts.entity.Floor;
import com.doposts.entity.User;
import com.doposts.service.impl.FloorServiceImpl;
import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.interfaces.FloorService;
import com.doposts.to.CommonResult;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SelectAllPostAndFloor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/21 16:29
 */
@WebServlet("/floor")
public class FloorServlet extends AbstractServlet{

    private FloorService floorService;

    @Override
    public Class<?> getServletClass() {
        return FloorServlet.class;
    }
    @Override
    public void init() throws ServletException {
        floorService = new FloorServiceImpl();
    }

    /**
     *  插入回复数据
     * @param request
     * @param response
     * @return
     */
    public  Object  insertFloor(HttpServletRequest request,HttpServletResponse response){
        String postid = request.getParameter("postid");
        Object object = request.getSession().getAttribute("user");
        if(object==null){
            return new CommonResult().unauthorized("未登录");
        }
        User user = (User)object;
        int floorCountByPostId = floorService.getFloorCountByPostId(Integer.parseInt(postid));

        Floor floor = new Floor();
        floor.setPostId(Integer.valueOf(postid));
        floor.setPostFloor(floorCountByPostId+1);
        floor.setCreateUserId(user.getUserId());
        floor.setPostContent(request.getParameter("replyContent"));
        floor.setSendDate(new Date());

        FloorWithReply floorWithReply = floorService.insertFloor(floor);

        if (floorWithReply != null){
            return new CommonResult().success(floorWithReply);
        }
        else{
            return new CommonResult().failed();
        }
        //floorWithReply.setPostFloor();
       // return new CommonResult().failed();
    }

}
