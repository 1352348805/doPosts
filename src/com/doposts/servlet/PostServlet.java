package com.doposts.servlet;

import com.doposts.entity.Post;
import com.doposts.service.impl.PostServiceImpl;
import com.doposts.service.interfaces.PostService;
import com.doposts.to.CommonResult;
import com.doposts.utils.Page;
import com.doposts.vo.PostInfo;
import com.doposts.vo.PostQueryParam;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author xiao yao
 * @date 2020/8/21 16:28
 */
@WebServlet("/post")
public class PostServlet extends AbstractServlet {

    private PostService postService;

    @Override
    public Class<?> getServletClass() {
        return PostServlet.class;
    }

    @Override
    public void init() throws ServletException {
        postService = new PostServiceImpl();
    }

    /**
     * 获取帖子列表
     */
    public CommonResult getPostList(HttpServletRequest request, HttpServletResponse response) {
        Integer pageIndex;
        Integer pageSize;
        Integer postClassLevel1Id;
        Integer postClassLevel2Id;
        Integer postClassLevel3Id;
        try {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
      } catch (Exception e) {
            pageIndex = 1;
            pageSize = 10;
        }
        if (request.getParameter("postClassLevel1Id") != null && !"-1".equals(request.getParameter("postClassLevel1Id"))) {
            postClassLevel1Id = Integer.parseInt(request.getParameter("postClassLevel1Id"));
        } else {
            postClassLevel1Id = null;
        }
        if (request.getParameter("postClassLevel2Id") != null && !"-1".equals(request.getParameter("postClassLevel2Id"))) {
            postClassLevel1Id = null;
            postClassLevel2Id = Integer.parseInt(request.getParameter("postClassLevel2Id"));
        } else {
            postClassLevel2Id = null;
        }
        if (request.getParameter("postClassLevel3Id") != null && !"-1".equals(request.getParameter("postClassLevel3Id"))) {
            postClassLevel2Id = null;
            postClassLevel3Id = Integer.parseInt(request.getParameter("postClassLevel3Id"));
        } else {
            postClassLevel3Id = null;
        }

        String postName = request.getParameter("postName");
        if (postName == null || postName.length() == 0) {
            postName = null;
        }
        String createUserName = request.getParameter("createUserName");
        if (createUserName == null || createUserName.length() == 0) {
            createUserName = null;
        }
        PostQueryParam queryParam = new PostQueryParam(postName,createUserName,postClassLevel1Id,postClassLevel2Id,postClassLevel3Id);

        Page<PostInfo> page = postService.getPostPageByCondition(queryParam,pageIndex,pageSize);
        return new CommonResult().success(page);
    }

    /**
     * 按条件获取总记录数
     */
    public CommonResult getPostCountByCondition(HttpServletRequest request, HttpServletResponse response) {
        PostQueryParam queryParam = new PostQueryParam();
        Integer count = postService.getPostCountByCondition(queryParam);
        return new CommonResult().success(count);
    }

    /**
     * 删除帖子
     */
    public CommonResult deletePost(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("postId"));
        boolean b = postService.deletePostById(id);
        if (b) {
            return new CommonResult().success(null);
        }
       return new CommonResult().failed("删除失败");
    }

}
