package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.PostClass;
import com.doposts.entity.User;

import java.util.List;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
        PostClass postClass = new PostClass();
        postClass.setClassFatherId(12);
        postClass.setClassLevel(3);
        postClass.setClassName("4399小游戏");
        System.out.println(PostItDatabase.POST_CLASS_DAO.insertPostClass(postClass));
    }
}