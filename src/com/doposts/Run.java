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
        System.out.println(PostItDatabase.REPLY_DAO.getReplyListById(1));
    }
}