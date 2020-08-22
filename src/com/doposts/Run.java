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
        long time = System.currentTimeMillis();
        for (int i = 0; i < 50; i++) {
            System.out.println(i+1);
            PostItDatabase.USER_DAO.selectUserCount();
            PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(0, 5);
            PostItDatabase.USER_DAO.selectUserCount();
            PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(5, 5);
            PostItDatabase.USER_DAO.selectUserCount();
            PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(10, 5);
            PostItDatabase.USER_DAO.selectUserCount();
            PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(15, 5);
            PostItDatabase.USER_DAO.selectUserCount();
            PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(20, 5);
        }
        System.out.println(System.currentTimeMillis() - time);
    }
}