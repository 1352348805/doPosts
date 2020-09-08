package com.doposts.filter;

import com.alibaba.fastjson.JSON;
import com.doposts.constant.SystemConstant;
import com.doposts.entity.User;
import com.doposts.log.entity.RequesterItem;
import com.doposts.log.monitor.UserLogMonitor;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 用户日志监控
 * @author asuk
 * @date 2020/9/3 0:21
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class UserLogFilter implements Filter {

    private static Logger logger = Logger.getLogger(UserLogFilter.class);
    private UserLogMonitor userLogMonitor;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        userLogMonitor = UserLogMonitor.getInstance();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        RequesterItem item = new RequesterItem();

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        //未登录
        if (user==null) {
            String uid = "";
            Object attribute = session.getAttribute(SystemConstant.USER_LOG_TOKEN);
            if (attribute == null) {
                uid = UUID.randomUUID().toString();
                session.setAttribute(SystemConstant.USER_LOG_TOKEN,uid);
            } else {
                uid = attribute.toString();
            }
            item.setId(uid);
        } else {
            item.setId(user.getUserId().toString());
        }

        Map<String, String[]> parameterMap = new HashMap<>();
        request.getParameterMap().keySet().forEach(key -> {
            parameterMap.put(key,request.getParameterMap().get(key));
        });

        item.setIp(request.getRemoteAddr())
                .setRequestUri(request.getRequestURI())
                .setReferer(request.getHeader("Referer"))
                .setRequestParameterMap(parameterMap)
                .setUserAgent(request.getHeader("User-Agent"))
                .setRequestTimestamp(System.currentTimeMillis());
        logger.info("记录用户操作日志:" + JSON.toJSONString(item));

        //记录到日志容器
        userLogMonitor.recordInLogContainer(item);

        filterChain.doFilter(request,response);

    }

    @Override
    public void destroy() {

    }

}
