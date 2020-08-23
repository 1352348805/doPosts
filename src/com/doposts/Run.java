package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.vo.PostQueryParam;

import java.util.List;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
        PostQueryParam queryParam = new PostQueryParam();
        queryParam.setPostName("大战");
        queryParam.setCreateUserName("系统管理员");
        queryParam.setPostClassLevel1Id(1);
        Integer info = PostItDatabase.POST_DAO.getPostCountByCondition(queryParam);
        System.out.println("返回数据：");
        System.out.println(info);
    }
}