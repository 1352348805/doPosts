package com.doposts.servlet;

import com.doposts.constant.SystemConstant;
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
        List<PostClassWithChildren> menu = postClassService.getMenu(request);
        return new CommonResult().success(menu);
    }

    /**
     * 跳转分类添加页面
     */
    public String toAdd(HttpServletRequest request, HttpServletResponse response) {
        return "admin/category/category_add";
    }

    /**
     * 删除分类
     */
    public CommonResult delete(HttpServletRequest request, HttpServletResponse response) {
        Integer classId = null;
        Integer level = null;
        try {
            classId = Integer.parseInt(request.getParameter("classId"));
            level = Integer.parseInt(request.getParameter("level"));
            if (level < 1 || level > 3) {
                throw new RuntimeException();
            }
        } catch (Exception e) {
            return new CommonResult().validateFailed("非法参数!!!");
        }

        if (level != 3) {
            Integer count = postClassService.getPostClasschildrenCountById(classId);
            if (count > 0) {
                return new CommonResult().failed("该分类下还有" + count + "条数据,不能删除!");
            }
        }
        boolean b = postClassService.deletePostClassById(classId);
        if (b) {
            //菜单缓存失效
            request.getServletContext().setAttribute(SystemConstant.CATEGORY_MENU_KEY,null);
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("删除失败!");
    }



}
