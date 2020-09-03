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
import com.doposts.utils.Page;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SelectAllPostAndFloor;
import com.doposts.vo.SuperPost;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
        request.setAttribute("targetURL",request.getHeader("Referer"));
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
    public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String targetURL = request.getParameter("targetURL");
        User user = userService.login(userName, password);
        if(user == null){
            request.setAttribute("username",userName);
            request.setAttribute("msg","账号或密码错误!");
            request.setAttribute("targetURL",targetURL);
            return "login";
        }
        request.getSession().setAttribute("user", user);
        if ((request.getRequestURL() + "?action=toLogin").equals(targetURL)) {
            response.sendRedirect(request.getContextPath() + "/user?action=index");
            return null;
        }
        response.sendRedirect(targetURL);
        return null;
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
        return "userweb/reply";
    }

    public CommonResult floorCount(HttpServletRequest request, HttpServletResponse response) {
        String pid = request.getParameter("postid");
        Integer count = floorService.getFloorCountByPostId(Integer.parseInt(pid));
        return new CommonResult().success(count);
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

    /**
     * 用户中心
     * @return
     */
    public String toUserCenter(HttpServletRequest request , HttpServletResponse response) {
        return "userweb/user_center";
    }

    public String toModifyUserInfo(HttpServletRequest request , HttpServletResponse response) {
        return "userweb/user_modify";
    }

    public CommonResult modifyUserInfo(HttpServletRequest request , HttpServletResponse response) {

        DiskFileItemFactory factory = new DiskFileItemFactory();

        ServletFileUpload sfu=new ServletFileUpload(factory);
        sfu.setFileSizeMax(1024*1024*5);
        String path=request.getServletContext().getRealPath("static/images");
        String fn=null;
        try {
            List<FileItem> list=sfu.parseRequest(request);
            for(FileItem item:list) {
                if (item.isFormField()) {
                    //TODO
                } else {
                    // 是文件
                    //获取图片后缀名
                    String format=item.getName().substring(item.getName().indexOf("."), item.getName().length());
                    System.out.println(format);
                    //图片命名
                    fn= UUID.randomUUID().toString().replaceAll("-", "")+format;
                    System.out.println("文件名是："+fn);  //文件名
                    // fn 是可能是这样的 c:\abc\de\tt\fish.jpg
                    item.write(new File(path,fn));
                }
            }
        } catch (Exception e) {
            return new CommonResult().failed("修改失败");
        }

        return new CommonResult().success(null);
    }

}
