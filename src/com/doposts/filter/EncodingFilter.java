package com.doposts.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 编码过滤器
 * @author asuk
 * @date 2020/7/16 15:46
 */
public class EncodingFilter implements Filter{

    private static String encoding;

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse) resp;
        if (!request.getRequestURI().contains("/static")) {
            request.setCharacterEncoding(encoding);
            response.setCharacterEncoding(encoding);
            response.setContentType("text/html;charset="+encoding);
        }
        chain.doFilter(req, resp);
    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        encoding = config.getInitParameter("encoding");
    }
}
