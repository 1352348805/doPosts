package com.doposts.servlet;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author Wu j
 * @date 2020/8/22 9:35
 */
@WebServlet("/test")
public class TestServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageIndexString = req.getParameter("page");
        int pageIndex = 1;
        if(pageIndexString != null){
            pageIndex = Integer.parseInt(pageIndexString);
        }
        int dataCount;
        req.setAttribute("dataCount",dataCount = PostItDatabase.USER_DAO.selectUserCount());
        int pageCount = dataCount % 5 == 0? dataCount / 5: dataCount / 5 + 1;
        if(pageIndex > pageCount){
            pageIndex = pageCount;
        }else if(pageIndex < 1){
            pageIndex = 1;
        }
        int startIndex = (pageIndex-1) * 5;
        List<User> userList = PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(startIndex, 5);
        req.setAttribute("userList", userList);
        req.getRequestDispatcher("/test.jsp").forward(req, resp);

    }
}
