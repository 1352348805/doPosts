package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.UserDao;
import com.doposts.entity.User;
import com.dxhualuo.database.impl.MySQL_C3P0;
import java.sql.SQLException;
import java.util.List;

/**
 *  用户DAO的实现
 * @author dx_hualuo
 */
public class UserDaoImpl extends MySQL_C3P0<User> implements UserDao {
    public UserDaoImpl(){
        super(DatabaseConfig.getUrl(), DatabaseConfig.getPort(), DatabaseConfig.getDatabase(), DatabaseConfig.getUserName(), DatabaseConfig.getPassword(), "post");
    }

    @Override
    public User selectUserByUserLoginNameAndPassword(String loginName, String password) {
        User user = new User();
        user.setUserLoginName(loginName);
        user.setUserPassword(password);
        return getUser(user);
    }

    @Override
    public User selectUserByLoginName(String loginName) {
        User user = new User();
        user.setUserLoginName(loginName);
        return getUser(user);
    }

    @Override
    public int insertUserByUser(User entity) {
        try {
            return insert(entity);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查看所有用户
     * @return 用户数据
     */
    @Override
    public List<User> selectFromUser() {
        return select(User.class);
    }

    /**
     * 从startIndex开始位置查询length条用户数据
     *
     * @param startIndex 开始位置
     * @param length     长度
     * @return List数据
     */
    @Override
    public List<User> selectUserByStartIndexAndLength(int startIndex, int length) {
        try {
            return select(User.class, startIndex, length);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询用户数量
     *
     * @return
     */
    @Override
    public int selectUserCount() {
        return 0;
    }

    /**
     *  实现查询
     * @param user user实体
     * @return user实体
     */
    private User getUser(User user) {
        List<User> users;
        try {
            users = select(User.class, user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(users.size() == 1){
            return users.get(0);
        }
        return null;
    }
}
