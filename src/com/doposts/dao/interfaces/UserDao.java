package com.doposts.dao.interfaces;

import com.doposts.entity.User;

import java.util.List;

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

    /**
     * 查看所有用户
     * @return 用户数据
     */
    List<User> selectFromUser();

    /**
     *  从startIndex开始位置查询length条用户数据
     * @param startIndex 开始位置
     * @param length 长度
     * @return List数据
     */
    List<User> selectUserByStartIndexAndLength(int startIndex, int length);

    /**
     * 查询用户数量
     * @return 用户的数量
     */
    int selectUserCount();

    /**
     * 删除用户
     * @param id 用户id
     * @return 影响行数
     */
    int deleteUser(int id);
    /**
     * 修改用户昵称、密码等。。。
     * @param user 实体类
     * @return 受影响行数
     */
    int updateUserInfo(User user);

    /**
     * 以id获取用户信息
     * @param id
     * @return user
     */
    User getUserById(int id);
}
