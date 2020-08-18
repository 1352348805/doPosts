package com.doposts.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户控制器
 * @author asuk
 * @date 2020/8/18 19:02
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@WebServlet("/user")
public class UserServlet extends AbstractServlet{

    @Override
    public Class getServletClass() {
        return UserServlet.class;
    }

    /**
     * 跳转登录页面
     */
    public String toLogin(HttpServletRequest request, HttpServletResponse response) {
        return "login";
    }

    public String login(HttpServletRequest request, HttpServletResponse response) {
        //TODO 登录验证

        return "";
    }

}
