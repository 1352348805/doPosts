package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.vo.PostInfo;
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
        List<PostInfo> info = PostItDatabase.POST_DAO.getPostListByCondition(queryParam, 0, 200);
        System.out.println("返回数据：");
        System.out.println(info);
    }
}