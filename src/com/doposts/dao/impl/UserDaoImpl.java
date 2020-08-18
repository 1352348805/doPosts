package com.doposts.dao.impl;

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
        super("post");
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
