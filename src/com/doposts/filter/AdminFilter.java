package com.doposts.filter;

import com.doposts.entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 管理员后台权限认证过滤器
 * @author asuk
 * @date 2020/8/25 10:34
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class AdminFilter implements Filter {

    public static Logger logger = Logger.getLogger(AdminFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        logger.info("IP " + servletRequest.getLocalAddr() + " 进入后台认证过滤器");
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        Object userObj = request.getSession().getAttribute("user");
        if (userObj != null) {
            User user = (User)userObj;
            if ("admin".equals(user.getGroup()) && user.getStatus() == 1) {
                filterChain.doFilter(request,response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/user?action=toLogin");
    }

    @Override
    public void destroy() {

    }
}
