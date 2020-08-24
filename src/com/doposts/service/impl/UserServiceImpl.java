package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.User;
import com.doposts.service.interfaces.UserService;

import java.util.ArrayList;
import java.util.List;
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
        if(PostItDatabase.USER_DAO.selectUserByLoginName(loginName) != null){
            return false;
        }
        int len = PostItDatabase.USER_DAO.insertUserByUser(user);
        return len > 0;
    }

    /**
     * 查看所有用户
     *
     * @return 是否成功
     */
    @Override
    public List<User> getAllUser() {
       List<User> list=new ArrayList<>();
       try {
           list=PostItDatabase.USER_DAO.selectFromUser();
       }catch (Exception e){
           e.printStackTrace();
       }
       return list;
    }

    /**
     * 根据a的位置b的长度查询（分页查询）
     *
     * @param index 起始位置
     * @param length 长度
     * @return
     */
    @Override
    public List<User> getUserByStartIndex(int index, int length) {
       List<User> userList=new ArrayList<>();
       try {
           int offset = (index - 1) * length;
           userList=PostItDatabase.USER_DAO.selectUserByStartIndexAndLength(offset, length);
       }catch (Exception e){
           e.printStackTrace();
       }
       return userList;
       }

    /**
     * 查询用户数量
     * @return 数量int
     */
    @Override
    public int getselectUserConut() {
        int count=0;
        try {
            count=PostItDatabase.USER_DAO.selectUserCount();
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }

    /**
     * 删除用户
     *
     * @param id id
     * @return 影响行数
     */
    @Override
    public int getDeleteUser(int id) {
        int qwq=0;
        try {
            qwq=PostItDatabase.USER_DAO.deleteUser(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return qwq;
    }

    /**
     * 修改用户
     *
     * @param user 实体类
     * @return 是否成功
     */
    @Override
    public boolean updateUser(User user) {
        return PostItDatabase.USER_DAO.updateUserInfo(user) == 1;
    }
}
