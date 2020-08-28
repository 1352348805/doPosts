package com.doposts.servlet;

import com.doposts.entity.Post;
import com.doposts.entity.User;
import com.doposts.service.impl.FloorServiceImpl;
import com.doposts.service.impl.PostServiceImpl;
import com.doposts.service.impl.UserServiceImpl;
import com.doposts.service.interfaces.FloorService;
import com.doposts.service.interfaces.PostService;
import com.doposts.service.interfaces.UserService;
import com.doposts.to.CommonResult;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SelectAllPostAndFloor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 用户控制器
 * @author asuk
 * @date 2020/8/18 19:02
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@WebServlet("/user")
public class UserServlet extends AbstractServlet{

    UserService userService;
    FloorService floorService;
    PostService postService;

    @Override
    public Class<?> getServletClass() {
        return UserServlet.class;
    }

    @Override
    public void init() throws ServletException {

        userService = new UserServiceImpl();

        floorService = new FloorServiceImpl();

        postService = new PostServiceImpl();
    }

    /**
     * 跳转登录页面
     */
    public String toLogin(HttpServletRequest request, HttpServletResponse response) {
        return "login";
    }

    /**
     * 跳转到登录页面
     */
    public String toRegister(HttpServletRequest request, HttpServletResponse response) {
        return "register";
    }

    /**
     * 登录验证
     * @param request
     * @param response
     * @return
     */
    public Object login(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.login(userName, password);
        if(user == null){
            return new CommonResult().failed();
        }
        request.getSession().setAttribute("user", user);
        return new CommonResult().success("");
    }

    /**
     * 注册用户
     * @param request
     * @param response
     * @return
     */
    public Object registerUser(HttpServletRequest request,HttpServletResponse response){
        String loginName=request.getParameter("loginName");
        String password=request.getParameter("password");
        String name=request.getParameter("name");
        boolean flag = userService.register(loginName,password,name);
        if(!flag){
            return new CommonResult().failed();
        }
        return new CommonResult().success("");
    }

    /**
     *  发送数据给页面
     * @param request
     * @param response
     * @return  楼层消息
     */
    public String postAndfloor(HttpServletRequest request, HttpServletResponse response){

        SelectAllPostAndFloor id = floorService.getFloorById(1);
        Post post= postService.getPostById(1);
        List<FloorWithReply> floorWithReplies= id.getFloor();
        request.setAttribute("post",post);
        request.setAttribute("floor",floorWithReplies);
        return "userweb/reply";
    }



    /**
     * 用户主页
     */
    public String index(HttpServletRequest request, HttpServletResponse response) {
        return "userweb/index";
    }


    /**
     *@Description 二级分类及一级分类下所有贴吧的展示(二级分类以forumpark命名)
     *@Param request/response
     *@Author Wang.li.ming
     *@Date 2020/8/23
     *@Time 19:01
     */
    public String forumpark(HttpServletRequest request , HttpServletResponse response){
        request.setAttribute("barid",request.getParameter("barId"));
        return "userweb/forumpark";
    }


   /**
    *@Description 转发到帖子列表
    *@Param
    *@Author Wang.li.ming
    *@Date 2020/8/26
    *@Time 22:20
    */
   public String postListpage(HttpServletRequest request , HttpServletResponse response){
       request.setAttribute("secondId",request.getParameter("secondId"));
       return "userweb/post";
   }

}
