package com.doposts.servlet;

import com.doposts.entity.User;
import com.doposts.service.impl.UserServiceImpl;
import com.doposts.to.CommonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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

    UserServiceImpl userService;

    @Override
    public Class<?> getServletClass() {
        return UserServlet.class;
    }

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
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
     * 查看用户
     * @param request
     * @param response
     * @return
     */
    public Object userManagement(HttpServletRequest request,HttpServletResponse response) throws Exception {
       User user;
        user= (User) userService.getAllUser();
        if (user==null){
            return new CommonResult().failed();
        }
        request.getSession().setAttribute("user",user);
        request.getRequestDispatcher("/admin/userlist.jsp").forward(request,response);
       return new CommonResult().success("") ;
    }
    /**
     * 用户主页
     */
    public String index(HttpServletRequest request, HttpServletResponse response) {
        return "userweb/index";
    }



}
