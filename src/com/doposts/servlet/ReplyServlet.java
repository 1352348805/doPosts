package com.doposts.servlet;

import com.doposts.entity.Reply;
import com.doposts.service.impl.FloorServiceImpl;
import com.doposts.service.impl.ReplyServiceImpl;
import com.doposts.service.interfaces.FloorService;
import com.doposts.service.interfaces.ReplyService;
import com.doposts.to.CommonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author xiao yao
 * @date 2020/9/1 19:43
 */
@WebServlet("/reply")
public class ReplyServlet extends AbstractServlet{
    private ReplyService replyService;

    @Override
    public Class<?> getServletClass() {
        return ReplyServlet.class;
    }
    @Override
    public void init() throws ServletException {
        replyService = new ReplyServiceImpl();
    }



    public CommonResult ReplyAndReply(HttpServletRequest request,HttpServletResponse response){

        Object object = request.getSession().getAttribute("user");
        if(object==null){
            return new CommonResult().unauthorized("未登录");
        }
        String floorid = request.getParameter("floorid");
        String replyContent = request.getParameter("replyContent");
        String replyUserId = request.getParameter("replyUserId");
        System.out.println("floorid:"+floorid);
        System.out.println("replyContent:"+replyContent);
        System.out.println("replyUserId:"+replyUserId);
        Reply reply=new Reply();
         reply.setFloorId(Integer.valueOf(floorid));
         reply.setReplyContent(replyContent);
         reply.setReplyUserId(Integer.valueOf(replyUserId));
         Date replyDate = new Date();
         reply.setReplyDate(replyDate);
         try {
             replyService.insertReple(reply);
         }catch (Exception e){
             return new CommonResult().failed();
         }
        return new CommonResult().success(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(replyDate));
    }
}
