package com.doposts.servlet;

import com.doposts.constant.SystemConstant;
import com.doposts.entity.PostClass;
import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.to.CommonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Stack;

/**
 * @author asuk
 * @date 2020/8/18 18:58
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@WebServlet("/admin")
public class AdminServlet extends AbstractServlet{

    private PostClassService postClassService;

    @Override
    public Class getServletClass() {
        return AdminServlet.class;
    }

    @Override
    public void init() throws ServletException {
        postClassService = new PostClassServiceImpl();
    }

    /**
     * 跳转后台主页
     */
    public String index(HttpServletRequest request, HttpServletResponse response) {
        return "admin/index";
    }

    /**
     * 跳转帖子分类列表
     * @return
     */
    public String categoryList(HttpServletRequest request, HttpServletResponse response) {
        return "admin/category/category_list";
    }

    /**
     * 跳转分类添加页面
     */
    public String toCategoryAdd(HttpServletRequest request, HttpServletResponse response) {
        return "admin/category/category_add";
    }

    /**
     * 跳转分类修改页面
     */
    public String toCategoryModify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer classId = null;
        try {
            classId = Integer.parseInt(request.getParameter("classId"));
            List<PostClass> postClassList = postClassService.getPostClassByIdWithParents(classId);
            request.setAttribute("postClassList",postClassList);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin?action=categoryList");
            return null;
        }
        return "admin/category/category_modify";
    }

    /**
     * 删除分类
     */
    public CommonResult deleteCategory(HttpServletRequest request, HttpServletResponse response) {
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
            Integer count = postClassService.getPostClassChildrenCountById(classId);
            if (count > 0) {
                return new CommonResult().failed("该c分类下还有" + count + "条数据,不能删除!");
            }
        }
        boolean b = postClassService.deletePostClassById(classId);
        if (b) {
            invalidMenuCache(request);
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("删除失败!");
    }

    /**
     * 添加分类
     */
    public CommonResult addCategory(HttpServletRequest request, HttpServletResponse response) {
        String className = request.getParameter("className");
        Integer type = Integer.parseInt(request.getParameter("type"));
        Integer parentId = Integer.parseInt(request.getParameter("parentId"));
        boolean isExists = postClassService.checkClassNameExists(className);
        if (isExists) {
            return new CommonResult().failed("该分类名已存在!");
        }
        PostClass postClass = new PostClass(null,className,type,parentId);
        boolean b = postClassService.addPostClass(postClass);
        if (b) {
            invalidMenuCache(request);
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("删除失败!");
    }

    /**
     * 修改分类
     */
    public CommonResult modifyCategory(HttpServletRequest request, HttpServletResponse response) {
        Integer classId = Integer.parseInt(request.getParameter("classId"));
        String className = request.getParameter("className");
        PostClass postClass = new PostClass(classId,className,null,null);
        boolean b = postClassService.modifyPostClass(postClass);
        if (b) {
            invalidMenuCache(request);
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("删除失败!");
    }

    /**
     * 使菜单缓存失效
     */
    private void invalidMenuCache(HttpServletRequest request) {
        request.getServletContext().setAttribute(SystemConstant.CATEGORY_MENU_KEY,null);
    }
}
