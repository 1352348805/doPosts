package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.vo.PostClassRequestInfo;
import java.util.List;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
        List<PostClassRequestInfo> infos = PostItDatabase.CREATE_CLASS_REQUEST_DAO.selectAllCreateClassRequestByCondition(0,2);
        System.out.println(infos);
    }
}