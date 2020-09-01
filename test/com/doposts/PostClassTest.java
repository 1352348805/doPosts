package com.doposts;

import com.doposts.entity.Post;
import com.doposts.entity.PostClass;
import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.impl.PostServiceImpl;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.service.interfaces.PostService;
import com.doposts.vo.PostClassWithChildren;
import com.doposts.vo.PostInfo;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.Date;
import java.util.List;

/**
 * @author asuk
 * @date 2020/8/19 20:58
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class PostClassTest {

    private PostClassService postClassService;
    long start;

    @Before
    public void init() {
        postClassService = new PostClassServiceImpl();
        start = System.currentTimeMillis();
    }

    @Test
    public void getMenu() {
        PostClassServiceImpl postClassService = new PostClassServiceImpl();
        List<PostClassWithChildren> menu = postClassService.getMenu();
        menu.forEach(oneClass -> {
            //一级
            System.out.println(oneClass);
            oneClass.getChildren().forEach(twoClass -> {
                //二级
                System.out.println(twoClass);
                twoClass.getChildren().forEach(three -> {
                    //三级
                    System.out.println(three);
                });
            });
        });
    }

    @Test
    public void getPostClassByIdWithParents() {
        List<PostClass> list = postClassService.getPostClassByIdWithParents(35);
        list.forEach(item -> System.out.println(item));

    }

    @Test
    public void t1() {
        PostInfo postInfo = new PostInfo();
        System.out.println(postInfo);
    }

    @Test
    public void t2() {
        List<PostClass> categoryListByParentId = postClassService.getThreePostClassListByParent(1);
        System.out.println(categoryListByParentId.size());
    }

    @Test
    public void t3() {
        PostService postService = new PostServiceImpl();
        for (int i = 0;i < 1000;i++) {

            Post post = new Post();
            post.setPostClassLevel1Id(1);
            post.setPostClassLevel2Id(7);
            post.setPostClassLevel3Id(35);
            post.setPostName("亚索好玩吗?"+(++i));
            post.setCreateDate(new Date());
            post.setCreateUserId(32);
            postService.addPost(post);
        }
    }

    @Test
    public void f222() {
        List<PostClass> postClassByIdWithParents = postClassService.getPostClassByIdWithParents(60);
    }


    @After
    public void after() {
        long end = System.currentTimeMillis();
        System.out.println("耗时:" + (end - start));
    }


}
