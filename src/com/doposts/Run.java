package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.PostClass;

import java.sql.ResultSet;

import static com.doposts.dao.PostItDatabase.DEFAULT_DAO;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
        for (int i = 0; i < 500; i++) {
            System.out.println(i+1);
            System.out.println(PostItDatabase.USER_DAO.selectUserCount());
            System.out.println(PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(0, 5));
            System.out.println(PostItDatabase.USER_DAO.selectUserCount());
            System.out.println(PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(5, 5));
            System.out.println(PostItDatabase.USER_DAO.selectUserCount());
            System.out.println(PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(10, 5));
            System.out.println(PostItDatabase.USER_DAO.selectUserCount());
            System.out.println(PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(15, 5));
            System.out.println(PostItDatabase.USER_DAO.selectUserCount());
            System.out.println(PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(20, 5));
        }

    }
}