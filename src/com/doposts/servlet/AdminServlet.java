package com.doposts.servlet;


import com.doposts.constant.SystemConstant;
import com.doposts.entity.CreateClassRequest;
import com.doposts.entity.PostClass;
import com.doposts.entity.User;
import com.doposts.service.impl.CreateClassRequestServiceImpl;
import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.impl.UserServiceImpl;
import com.doposts.service.interfaces.CreateClassRequestService;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.service.interfaces.UserService;
import com.doposts.to.CommonResult;
import com.doposts.utils.Page;
import com.doposts.vo.PostClassRequestInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author asuk
 * @date 2020/8/18 18:58
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@WebServlet("/admin")
public class AdminServlet extends AbstractServlet{

    private PostClassService postClassService;
    private CreateClassRequestService createClassRequestService;
    private UserService userService;

    @Override
    public Class<?> getServletClass() {
        return AdminServlet.class;
    }

    @Override
    public void init() throws ServletException {
        postClassService = new PostClassServiceImpl();
        createClassRequestService = new CreateClassRequestServiceImpl();
        userService = new UserServiceImpl();
    }

    /**
     * 使菜单缓存失效
     */
    private void invalidMenuCache(HttpServletRequest request) {
        request.getServletContext().setAttribute(SystemConstant.CATEGORY_MENU_KEY,null);
    }

    /**
     * 跳转后台主页
     */
    public String index(HttpServletRequest request, HttpServletResponse response) {
        return "admin/index";
    }

    /**
     * 后台退出
     */
    public String exit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/user?action=toLogin");
        return null;
    }

    /**
     * 查看所有用户
     * @param request
     * @param response
     * @return 用户
     */
    public String tUser(HttpServletRequest request, HttpServletResponse response){
        List<User> list=userService.getAllUser();
        request.getSession().setAttribute("list",list);
        return "admin/user/user_list";
    }

    /**
     * 跳转修改密码页面
     */
    public String toModifyPwd(HttpServletRequest request, HttpServletResponse response) {
        return "admin/user/pwd_modify";
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
                return new CommonResult().failed("该分类下还有" + count + "条数据,不能删除!");
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
        String classDescribe = request.getParameter("classDescribe");
        Integer parentId = Integer.parseInt(request.getParameter("parentId"));
        boolean isExists = postClassService.checkClassNameExists(className);
        if (isExists) {
            return new CommonResult().failed("该分类名已存在!");
        }
        PostClass postClass = new PostClass(null,className,type,parentId,classDescribe);
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
        String classDescribe = request.getParameter("classDescribe");
        PostClass postClass = new PostClass(classId,className,null,null,classDescribe);
        boolean b = postClassService.modifyPostClass(postClass);
        if (b) {
            invalidMenuCache(request);
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("删除失败!");
    }

    public String toAuthorize(HttpServletRequest request, HttpServletResponse response) {
        return "admin/category/category_authorization";
    }

    /**
     * 获取未审核用户创建分类的数量
     */
    public CommonResult getUnauthorizedClassCount(HttpServletRequest request, HttpServletResponse response) {
        Integer count = createClassRequestService.getUnauthorizedClassCount();
        return new CommonResult().success(count);
    }

    /**
     * 获取分类申请总记录数
     */
    public CommonResult getCreateClassRequestCount(HttpServletRequest request, HttpServletResponse response) {
        Integer count = createClassRequestService.getCreateClassRequestCount();
        return new CommonResult().success(count);
    }

    /**
     * 获取请求分类列表
     */
    public CommonResult getCreateClassRequestList(HttpServletRequest request, HttpServletResponse response) {
        Integer pageIndex = null;
        Integer pageSize = null;
        try {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } catch (Exception e) {
            pageIndex = 1;
            pageSize = 8;
        }
        Page<PostClassRequestInfo> page = createClassRequestService.getPageByCreateClassRequest(pageIndex, pageSize);
        return new CommonResult().success(page);
    }

    /**
     * 通过状态切换
     */
    public CommonResult passStatusChange(HttpServletRequest request, HttpServletResponse response) {
        Integer requestId = Integer.parseInt(request.getParameter("requestId"));
        Integer isPass = Integer.parseInt(request.getParameter("isPass"));
        CreateClassRequest classRequest = new CreateClassRequest();
        classRequest.setRequestId(requestId);
        classRequest.setIsPass(isPass > 0 ? true : false);
        classRequest.setIsProcess(true);
        classRequest.setReviewerId(1);
        classRequest.setReviewDate(new Date());
        boolean b = createClassRequestService.modifyRequestStatus(classRequest);
        if (b) {
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("操作失败");
    }
}
