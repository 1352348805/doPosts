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

}
