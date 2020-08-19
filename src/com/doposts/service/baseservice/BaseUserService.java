package com.doposts.service.baseservice;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.User;

import java.util.List;
import java.util.Objects;

/**
 *  用户Service层，包含的基础方法
 * @author dx_hualuo
 */
public class BaseUserService {
    /**
     *  登录方法
     * @param loginName 登录名
     * @param password 密码
     * @return User实体类，如果登陆失败则为Null
     */
    public User login(String loginName, String password){
        User user = PostItDatabase.USER_DAO.selectUserByLoginName(loginName);
        if(user == null){
            return null;
        }
        if(!Objects.equals(user.getUserPassword(), password)){
            return null;
        }
        return user;
    }

    /**
     *  注册普通用户
     * @param loginName 登录名
     * @param password 密码
     * @param userName 用户昵称
     * @return 是否注册成功，如果注册不成功就代表用户名被注册
     */
    public boolean register(String loginName, String password, String userName){
        User user = new User();
        user.setUserLoginName(loginName);
        user.setUserPassword(password);
        user.setUserName(userName);
        user.setGroup("user");
        int len = PostItDatabase.USER_DAO.insertUserByUser(user);
        return len > 0;
    }
}
