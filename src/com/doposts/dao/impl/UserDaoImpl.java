package com.doposts.dao.impl;

import com.doposts.dao.CrudHandler;
import com.doposts.dao.PostItDatabase;
import com.doposts.dao.interfaces.UserDao;
import com.doposts.entity.User;
import com.dxhualuo.database.handler.interfaces.DatabaseCrud;
import com.dxhualuo.database.handler.interfaces.SuperCrud;
import java.sql.SQLException;
import java.util.List;

/**
 *  用户DAO的实现
 * @author dx_hualuo
 */
public class UserDaoImpl implements UserDao {
    SuperCrud<User> crud;
    DatabaseCrud basicCrud;

    public UserDaoImpl() {
        this.crud = CrudHandler.userCrud;
        this.basicCrud = PostItDatabase.CRUD;
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
            return crud.insert(entity);
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
        return crud.select(User.class);
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
            return crud.select(User.class, startIndex, length);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询用户数量
     * @return 用户的数量
     */
    @Override
    public int selectUserCount() {
        return crud.selectCount(User.class);
    }

    /**
     *  实现查询
     * @param user user实体
     * @return user实体
     */
    private User getUser(User user) {
        List<User> users;
        try {
            users = crud.select(User.class, user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(users.size() == 1){
            return users.get(0);
        }
        return null;
    }
}
