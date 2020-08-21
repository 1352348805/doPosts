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
        System.out.println(PostItDatabase.CREATE_CLASS_REQUEST_DAO.selectAllCreateClassRequestByCondition(0, 2));
    }
}