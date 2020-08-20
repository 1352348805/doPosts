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
     * 获取菜单分类数据
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
            //菜单缓存失效
            request.getServletContext().setAttribute(SystemConstant.CATEGORY_MENU_KEY,null);
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("删除失败!");
    }



}
