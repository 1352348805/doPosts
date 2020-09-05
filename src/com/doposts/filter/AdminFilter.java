package com.doposts.filter;

import com.doposts.entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 管理员后台权限认证过滤器
 * @author asuk
 * @date 2020/8/25 10:34
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class AdminFilter implements Filter {

    public static Logger logger = Logger.getLogger(AdminFilter.class);

    /**
     * 对外开放的action
     */
    private List<String> openAction = new ArrayList<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        openAction.add("toLogin");
        openAction.add("login");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        Map<String, String[]> requestParameterMap = request.getParameterMap();
        if (requestParameterMap != null && requestParameterMap.size() > 0) {
            String[] actions = requestParameterMap.get("action");
            if (actions != null && actions.length > 0) {
                String action = actions[0];
                for (String url:openAction) {
                    if (url.equals(action)) {
                        try {
                            filterChain.doFilter(request,response);
                            return;
                        } catch (IOException | ServletException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        logger.info("IP " + servletRequest.getLocalAddr() + " 进入后台认证过滤器");
        Object userObj = request.getSession().getAttribute("user");
        if (userObj != null) {
            User user = (User)userObj;
            if (("admin".equals(user.getGroup()) || "root".equals(user.getGroup())) && user.getStatus() == 1) {
                filterChain.doFilter(request,response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin?action=toLogin");
    }

    @Override
    public void destroy() {

    }
}
