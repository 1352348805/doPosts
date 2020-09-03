package com.doposts.filter;

import com.alibaba.fastjson.JSON;
import com.doposts.entity.User;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * 用户日志监控
 * @author asuk
 * @date 2020/9/3 0:21
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class UserLogFilter implements Filter {

    private static Logger logger = Logger.getLogger(UserLogFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        UserLogFilter.RequestUserInfo userInfo = new UserLogFilter.RequestUserInfo();

        User user = (User)request.getSession().getAttribute("user");
        userInfo.setId(user==null?0:user.getUserId());
        userInfo.setIp(request.getRemoteAddr());
        userInfo.setRequestUri(request.getRequestURI());
        userInfo.setReferer(request.getHeader("Referer"));
        userInfo.setRequestParameterMap(request.getParameterMap());
        userInfo.setUserAgent(request.getHeader("User-Agent"));
        logger.info("记录用户操作日志:" + JSON.toJSONString(userInfo));

        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }

    private static class RequestUserInfo {
        //用户id 0为未登录
        private Integer id;
        //用户ip
        private String ip;
        //请求的URL
        private String requestUri;
        //请求的参数
        private Map<String,String[]> requestParameterMap;
        //上一个URL
        private String referer;
        //用户软件信息
        private String userAgent;

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }

        private String getIp() {
            return ip;
        }

        private void setIp(String ip) {
            this.ip = ip;
        }

        public String getRequestUri() {
            return requestUri;
        }

        public void setRequestUri(String requestUri) {
            this.requestUri = requestUri;
        }

        public Map<String, String[]> getRequestParameterMap() {
            return requestParameterMap;
        }

        public void setRequestParameterMap(Map<String, String[]> requestParameterMap) {
            this.requestParameterMap = requestParameterMap;
        }

        public String getReferer() {
            return referer;
        }

        public void setReferer(String referer) {
            this.referer = referer;
        }

        public String getUserAgent() {
            return userAgent;
        }

        public void setUserAgent(String userAgent) {
            this.userAgent = userAgent;
        }
    }
}
