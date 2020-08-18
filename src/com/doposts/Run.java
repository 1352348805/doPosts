package com.doposts;

import com.doposts.service.baseservice.BaseUserService;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
        BaseUserService userService = new BaseUserService();
        System.out.println(userService.login("admin", "123456"));
    }
}