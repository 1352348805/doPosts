package com.doposts;

import com.doposts.service.impl.PostClassServiceImpl;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.vo.PostClassWithChildren;
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

    @Before
    public void init() {
        postClassService = new PostClassServiceImpl();
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
}
