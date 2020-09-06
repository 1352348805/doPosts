package com.doposts.servlet;

import com.doposts.entity.Reply;
import com.doposts.entity.User;
import com.doposts.service.impl.FloorServiceImpl;
import com.doposts.service.impl.ReplyServiceImpl;
import com.doposts.service.interfaces.FloorService;
import com.doposts.service.interfaces.ReplyService;
import com.doposts.to.CommonResult;
import com.doposts.vo.SuperReply;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
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
        System.out.println(object);
        if(object==null){
            return new CommonResult().unauthorized("未登录");
        }

        String floorid = request.getParameter("floorid");
        String replyContent = request.getParameter("replyContent");
        String replyUserId = request.getParameter("replyUserId");
         String repliedUserId=request.getParameter("repliedUserId");
        System.out.println("floorid:"+floorid);
        System.out.println("replyContent:"+replyContent);
        System.out.println("replyUserId:"+replyUserId);
        System.out.println("repliedUserId:"+repliedUserId);
        Reply reply=new Reply();
         reply.setFloorId(Integer.valueOf(floorid));
         reply.setReplyContent(replyContent);
         reply.setReplyUserId(Integer.valueOf(replyUserId));
         if (repliedUserId != null && !"".equals(repliedUserId) && !"0".equals(repliedUserId)){
             reply.setRepliedUserId(Integer.valueOf(repliedUserId));
         }
         Date replyDate = new Date();
         reply.setReplyDate(replyDate);
         try {
             replyService.insertReple(reply);
         }catch (Exception e){
             return new CommonResult().failed();
         }
        return new CommonResult().success(reply);
    }
}
