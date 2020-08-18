package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.UserDao;
import com.doposts.entity.User;
import com.dxhualuo.database.impl.MySQL_C3P0;

/**
 *  用户DAO的实现
 * @author dx_hualuo
 */
public class UserDaoImpl extends MySQL_C3P0<User> implements UserDao {
    public UserDaoImpl(){
        super("post");
    }

    @Override
    public User selectUserByUserNameAndPassword(String userName, String password) {
        return null;
    }
}
