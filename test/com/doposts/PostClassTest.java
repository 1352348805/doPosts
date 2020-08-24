package com.doposts;

import com.doposts.entity.PostClass;
import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.vo.PostClassWithChildren;
import com.doposts.vo.PostInfo;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

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


    @After
    public void after() {
        long end = System.currentTimeMillis();
        System.out.println("耗时:" + (end - start));
    }
}
