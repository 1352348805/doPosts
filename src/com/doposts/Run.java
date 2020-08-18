package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.impl.PostDaoImpl;
import com.doposts.entity.Post;
import com.doposts.service.baseservice.BaseUserService;
import com.dxhualuo.database.Database;


public class Run {
    public static void main(String[] args) throws Exception{
        BaseUserService userService = new BaseUserService();
        System.out.println(userService.register("dx_hualuo", "11551155", "弦断花落丿"));
    }
}