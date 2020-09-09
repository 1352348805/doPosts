package com.doposts.servlet;


import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.doposts.constant.SystemConstant;
import com.doposts.dao.PostItDatabase;
import com.doposts.entity.CreateClassRequest;
import com.doposts.entity.PostClass;
import com.doposts.entity.User;
import com.doposts.log.entity.RequesterItem;
import com.doposts.log.monitor.UserLogMonitor;
import com.doposts.service.impl.*;
import com.doposts.service.interfaces.*;
import com.doposts.to.CommonResult;
import com.doposts.utils.Page;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.PostClassRequestInfo;
import com.doposts.vo.SelectAllPostAndFloor;
import com.doposts.vo.SuperPost;

import javax.jms.Message;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * @author asuk
 * @date 2020/8/18 18:58
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@WebServlet("/admin")
public class AdminServlet extends AbstractServlet {

    private PostClassService postClassService;
    private CreateClassRequestService createClassRequestService;
    private UserService userService;
    private PostService postService;
    private FloorService floorService;
    private ReplyService replyService;
    private UserLogMonitor userLogMonitor;

    @Override
    public Class<?> getServletClass() {
        return AdminServlet.class;
    }

    @Override
    public void init() throws ServletException {
        postClassService = new PostClassServiceImpl();
        createClassRequestService = new CreateClassRequestServiceImpl();
        userService = new UserServiceImpl();
        postService = new PostServiceImpl();
        floorService = new FloorServiceImpl();
        replyService = new ReplyServiceImpl();
        userLogMonitor = UserLogMonitor.getInstance();
    }

    /**
     * 使菜单缓存失效
     */
    private void invalidMenuCache(HttpServletRequest request) {
        request.getServletContext().setAttribute(SystemConstant.CATEGORY_MENU_KEY, null);
    }

    /**
     * 跳转到后台登录页
     */
    public String toLogin(HttpServletRequest request, HttpServletResponse response) {
        return "admin/login";
    }

    /**
     * 管理员登录
     */
    public CommonResult login(HttpServletRequest request, HttpServletResponse response) {
        String userCode = request.getParameter("userCode");
        String userPassword = request.getParameter("userPassword");
        int i = userService.loginAdmin(userCode,userPassword,request);
        if (i == -1)
        {
            return new CommonResult().failed("账号或密码错误!");
        }
        else if (i == -2) {
            return new CommonResult().unauthorized("管理员后台,用户止步!");
        }
        else if (i == -3) {
            return new CommonResult().forbidden("该账号已被封禁!");
        }
        return new CommonResult().success(null);
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
        response.sendRedirect(request.getContextPath() + "/admin?action=toLogin");
        return null;
    }

    /**
     * 查看所有用户
     *
     * @param request
     * @param response
     * @return 用户
     */
    public String tUser(HttpServletRequest request, HttpServletResponse response) {
        return "admin/user/user_list";
    }

    /**
     * 删除用户
     *
     * @param request
     * @param response
     * @return
     */
    public String delete(HttpServletRequest request, HttpServletResponse response) {

        int c = Integer.valueOf(request.getParameter("userId"));
        userService.getDeleteUser(c);
        return "admin/user/user_list";
    }

    /**
     * 修改(查询id值 带入修改页)
     *
     * @param request
     * @param response
     * @return
     */
    public String update(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.valueOf(request.getParameter("userId"));
        User user = userService.getUserById(id);
        request.setAttribute("sb", user);
        return "admin/user/user_update";
    }

    /**
     * 修改(用户数据)
     *
     * @param request
     * @param response
     * @return
     */
    public Object updateTwa(HttpServletRequest request, HttpServletResponse response) {
        Integer userid = Integer.parseInt(request.getParameter("userId"));
//        String userLoginName = request.getParameter("userLoginName");
        Integer status = Integer.parseInt(request.getParameter("status"));
        String userPassword = request.getParameter("userPassword");
        String userName = request.getParameter("userName");
        String group = request.getParameter("group");
        User user = new User();
        user.setUserId(userid);
//        user.setUserLoginName(userLoginName);
        user.setStatus(status);
        user.setUserPassword(userPassword);
        user.setUserName(userName);
        user.setGroup(group);
//        if (PostItDatabase.USER_DAO.selectUserByLoginName(user.getUserLoginName())!=null){
//           return false;
//       }else{
//            userService.updateUser(user);
//            return "admin/user/user_update";
//        }
        boolean b = userService.updateUser(user);
        if (b) {
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("更新失败");
    }

    /**
     * 获取总记录数
     *
     * @param request
     * @param response
     * @return 总记录数
     */
    public CommonResult userCount(HttpServletRequest request, HttpServletResponse response) {
        int count = userService.getselectUserConut();
        return new CommonResult().success(count);
    }
    /**
     * 分页查询
     *
     * @param request
     * @param response
     * @return
     */
    public CommonResult userIndexANDSize(HttpServletRequest request, HttpServletResponse response) {
        Integer pageindex = null;
        Integer pageSize = null;
        try {
            pageindex = Integer.valueOf(request.getParameter("pageIndex"));
            pageSize = Integer.valueOf(request.getParameter("pageSize"));
        } catch (Exception e) {
            pageindex = 1;
            pageSize = 10;
        }
        List<User> list = null;
        try {
            list = userService.getUserByStartIndex(pageindex, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new CommonResult().success(list);
    }

    /**
     * 跳转修改密码页面
     */
    public String toModifyPwd(HttpServletRequest request, HttpServletResponse response) {
        return "admin/user/pwd_modify";
    }

    /**
     * 帖子列表
     */
    public String postList(HttpServletRequest request, HttpServletResponse response) {
        return "admin/post/post_list";
    }

    /**
     * 跳转帖子分类列表
     *
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
            request.setAttribute("postClassList", postClassList);
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
        PostClass postClass = new PostClass(null, className, type, parentId, classDescribe);
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
        String imageUrl = request.getParameter("imageUrl");
        PostClass postClass = new PostClass(classId, className, null, null, classDescribe);
        postClass.setImageUrl(imageUrl);
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
        classRequest.setIsPass(isPass > 0);
        classRequest.setIsProcess(true);
        User user = (User) request.getSession().getAttribute("user");
        classRequest.setReviewerId(user.getUserId());
        classRequest.setReviewDate(new Date());
        boolean b = createClassRequestService.modifyRequestStatus(classRequest);
        if (b) {
            invalidMenuCache(request);
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("操作失败");
    }

    /**
     * 切换审核状态
     */
    public CommonResult processStatusChange(HttpServletRequest request, HttpServletResponse response) {
        Integer requestId = Integer.parseInt(request.getParameter("requestId"));
        Integer isProcess = Integer.parseInt(request.getParameter("isProcess"));
        CreateClassRequest classRequest = new CreateClassRequest();
        classRequest.setRequestId(requestId);
        classRequest.setIsProcess(isProcess > 0);
        User user = (User) request.getSession().getAttribute("user");
        classRequest.setReviewerId(user.getUserId());
        classRequest.setReviewDate(new Date());
        boolean b = createClassRequestService.modifyRequestStatus(classRequest);
        if (b) {
            invalidMenuCache(request);
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("操作失败");
    }

    /**
     * 检查密码
     */
    public CommonResult checkPwd(HttpServletRequest request, HttpServletResponse response) {
        String oldPassword = request.getParameter("oldpassword");
        User user = (User) request.getSession().getAttribute("user");
        if (oldPassword.equals(user.getUserPassword())) {
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("密码错误");
    }

    /**
     * 更换密码
     */
    public CommonResult changePwd(HttpServletRequest request, HttpServletResponse response) {
        String password = request.getParameter("password");
        User user = (User) request.getSession().getAttribute("user");
        user.setUserPassword(password);
        boolean b = userService.updateUser(user);
        if (b) {
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("修改失败");
    }

    public String toUserMonitor(HttpServletRequest request, HttpServletResponse response) {
        return "admin/monitor/user_monitor";
    }

    public String toPostReplyManag(HttpServletRequest request, HttpServletResponse response) {
        Integer pageIndex = null;
        Integer pageSize = null;
        try{
            pageIndex = Integer.valueOf(request.getParameter("pageindex"));
            System.out.println("当前页码："+pageIndex);
            pageSize = Integer.valueOf(request.getParameter("pageSize"));
            System.out.println("显示页数："+pageSize);
        }
        catch(Exception e){
            pageIndex = 1;
            pageSize = 10;
        }
        Integer postid = Integer.valueOf(request.getParameter("postid"));
        postService.postViewNumber(postid);
        Integer floorCountByPostId = floorService.getFloorCountByPostId(postid);
        Page<FloorWithReply> page=new Page<FloorWithReply>();
        page.setTotalCount(floorCountByPostId);
        page.setCurrPageNo(pageIndex);
        page.setPageSize(pageSize);

        SelectAllPostAndFloor id = floorService.getFloorById(postid,page.getCurrPageNo(),page.getPageSize());

        SuperPost superPost= postService.getSuperPostById(postid);
        List<FloorWithReply> floorWithReplies= id.getFloor();
        request.setAttribute("post",superPost);
        request.setAttribute("page",page);
        request.setAttribute("floor",floorWithReplies);
        request.setAttribute("postid",postid);
        return "admin/post/post_reply_manag";
    }

    /**
     * 删楼
     */
    public CommonResult deleteFloor(HttpServletRequest request, HttpServletResponse response) {
        Integer postId = Integer.valueOf(request.getParameter("postId"));
        Integer floorId = Integer.valueOf(request.getParameter("floorId"));
        boolean b = floorService.deleteFloor(postId,floorId);
        if (b) {
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("删除失败");
    }


    /**
     * 删回复
     */
    public CommonResult deleteReply(HttpServletRequest request, HttpServletResponse response) {
        Integer replyId = Integer.valueOf(request.getParameter("replyId"));
        boolean b = replyService.deleteReply(replyId);
        if (b) {
            return new CommonResult().success(null);
        }
        return new CommonResult().failed("删除失败");
    }

    /**
     * 获取用户日志容器
     */
    public CommonResult userLogList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, LinkedList<RequesterItem>> logContainer = userLogMonitor.getLogContainer();
        List<LinkedList<RequesterItem>> list = new LinkedList<>(logContainer.values());

        PrintWriter out = response.getWriter();
        out.print(JSONObject.toJSONString(new CommonResult().success(list), SerializerFeature.DisableCircularReferenceDetect));
        out.flush();
        out.close();
        return null;
    }

    /**
     * 清除不活跃用户日志
     */
    public CommonResult clearInactiveData(HttpServletRequest request, HttpServletResponse response) {
        userLogMonitor.clearInactiveData(true);
        return new CommonResult().success(null);
    }

}
