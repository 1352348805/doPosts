package com.doposts.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author asuk
 * @date 2020/8/18 18:58
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@WebServlet("/admin")
public class AdminServlet extends AbstractServlet{

    @Override
    public Class getServletClass() {
        return AdminServlet.class;
    }


}
