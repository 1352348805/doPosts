package com.doposts.servlet;

import com.doposts.constant.SystemConstant;
import com.doposts.entity.PostClass;
import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.to.CommonResult;
import com.doposts.vo.PostClassWithChildren;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
    public Class<?> getServletClass() {
        return PostClassServlet.class;
    }

    @Override
    public void init() throws ServletException {
        postClassService = new PostClassServiceImpl();
    }

    /**
     * 获取菜单分类数据
     */
    public CommonResult getClassList(HttpServletRequest request, HttpServletResponse response) {
        List<PostClassWithChildren> menu = postClassService.getMenu(request);
        return new CommonResult().success(menu);
    }

    /**
     * 获取子分类列表
     * @param request
     * @param response
     * @return
     */
    public CommonResult queryCategoryList(HttpServletRequest request, HttpServletResponse response) {
        Integer parentId = Integer.parseInt(request.getParameter("parentId"));
        List<PostClass> postClassList = postClassService.getCategoryListByParentId(parentId);
        return new CommonResult().success(postClassList);
    }

    /**
     * 获取分类导航
     */
    public CommonResult getAllBar(HttpServletRequest request, HttpServletResponse response) {
        List<PostClass> oneClassList = postClassService.getCategoryListByParentId(0);
        return new CommonResult().success(oneClassList);
    }

    /**
     * 模糊查询分类列表
     */
    public CommonResult getBarByName(HttpServletRequest request, HttpServletResponse response) {
        String className = request.getParameter("className");
        List<PostClass> list = postClassService.getThreePostClassListByName(className);
        return new CommonResult().success(list);
    }

    /**
     *@Description 二级分类及一级分类下所有贴吧的展示(二级分类以forumpark命名)
     *@Param request/response
     *@Author Wang.li.ming
     *@Date 2020/8/23
     *@Time 19:01
     */
    public String forumpark(HttpServletRequest request , HttpServletResponse response){

        return "userweb/forumpark";
    }


}
