package com.doposts.servlet;

import com.doposts.to.CommonResult;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author asuk
 * @date 2020/8/19 15:30
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@WebServlet("/postCategory")
public class PostClassServlet extends AbstractServlet{

    @Override
    public Class getServletClass() {
        return PostClassServlet.class;
    }

    /**
     * 获取分类列表
     */
    public CommonResult getClassList(HttpServletRequest request, HttpServletResponse response) {

        return new CommonResult().success(null);
    }



}
