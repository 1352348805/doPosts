package com.doposts.dao.interfaces;

import com.doposts.entity.User;

/**
 *  用户的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface UserDao {
    /**
     *  通过用户名密码在数据库查询对应用户
     * @param userName 用户名
     * @param password 密码
     * @return 查询结果
     */
    User selectUserByUserLoginNameAndPassword(String userName, String password);

    /**
     *  通过登录名来查询用户
     * @param loginName 登录名
     * @return User实体类
     */
    User selectUserByLoginName(String loginName);

    /**
     *  插入一个新的用户
     * @param entity User实体类
     * @return 受影响行数
     */
    int insertUserByUser(User entity);
}
