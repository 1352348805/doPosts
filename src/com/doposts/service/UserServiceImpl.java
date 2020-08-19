package com.doposts.service;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.User;
import com.doposts.service.interfaces.UserService;

import java.util.Objects;

/**
 * @author Wu j
 * @date 2020/8/19 13:40
 */
public class UserServiceImpl implements UserService {
    /**
     *  登录方法
     * @param loginName 登录名
     * @param password 密码
     * @return User实体类，如果登陆失败则为Null
     */
    @Override
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
    @Override
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
