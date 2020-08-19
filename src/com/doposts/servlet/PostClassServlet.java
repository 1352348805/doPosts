package com.doposts.servlet;

import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.to.CommonResult;
import com.doposts.vo.PostClassWithChildren;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author asuk
 * @date 2020/8/19 15:30
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@WebServlet("/postCategory")
public class PostClassServlet extends AbstractServlet{

    private PostClassService postClassService;

    @Override
    public Class getServletClass() {
        return PostClassServlet.class;
    }

    @Override
    public void init() throws ServletException {
        postClassService = new PostClassServiceImpl();
    }

    /**
     * 获取分类数据
     */
    public CommonResult getClassList(HttpServletRequest request, HttpServletResponse response) {
        List<PostClassWithChildren> menu = postClassService.getMenu();
        return new CommonResult().success(menu);
    }

    /**
     * 跳转分类添加页面
     */
    public String toAdd(HttpServletRequest request, HttpServletResponse response) {
        return "admin/category/category_add";
    }



}
