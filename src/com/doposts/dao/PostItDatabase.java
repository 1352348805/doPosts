package com.doposts.dao;

import com.doposts.dao.impl.*;
import com.doposts.dao.interfaces.*;
import com.doposts.dao.monitor.proxy.InterfaceInvokeHandler;
import com.dxhualuo.database.connection.C3P0ConnectionManager;
import com.dxhualuo.database.connection.ConnectionManager;
import com.dxhualuo.database.connectionpool.config.C3P0_Config;
import com.dxhualuo.database.handler.MySQLSuperCrudHandler;
import com.dxhualuo.database.handler.base.DatabaseCrudHandler;
import com.dxhualuo.database.handler.interfaces.DatabaseCrud;
import com.dxhualuo.database.handler.interfaces.SuperCrud;
import com.dxhualuo.database.interfaces.Database;

import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.SQLException;

import static com.dxhualuo.database.connection.ConnectionManager.URL_PARAMETER;

/**
 *  数据库实体类
 * @author dx_hualuo
 */
@SuppressWarnings("unused")
public class PostItDatabase {
    //初始化顺序不要动，C3P0连接配置在第一个FloorDaoImpl类中
    //代理对象请放到这里
    public static final FloorDao FLOOR_DAO;
    public static final PostClassDao POST_CLASS_DAO;
    public static final PostDao POST_DAO;
    public static final ReplyDao REPLY_DAO;
    public static final UserDao USER_DAO;
    public static final CreateClassRequestDao CREATE_CLASS_REQUEST_DAO;
    private static final DatabaseCrud CRUD;
    private static final ConnectionManager CONNECTION_MANAGER;

    static {
        //创建C3P0连接池参数
        C3P0_Config config = new C3P0_Config();
        config.jdbcUrl = "jdbc:mysql://"+DatabaseConfig.getUrl()+":"+ DatabaseConfig.getPort().toString()+ "/"+ DatabaseConfig.getDatabase()+ URL_PARAMETER;
        config.driverClass = "com.mysql.cj.jdbc.Driver";
        config.initialPoolSize = 3;
        config.acquireIncrement = 5;
        config.minPoolSize = 2;
        config.maxPoolSize = 30;
        config.user = DatabaseConfig.getUserName();
        config.password = DatabaseConfig.getPassword();
        //创建连接池
        CONNECTION_MANAGER = new C3P0ConnectionManager( "post_it", config);
        //创建基本增删改查处理器
        CRUD = new DatabaseCrudHandler(CONNECTION_MANAGER);
        //增强的通过实体类进行增删改查的处理器，且包含MySQL的特性（Limit）
        CrudHandler.floorCrud = new MySQLSuperCrudHandler<>(CRUD);
        CrudHandler.postClassCrud = new MySQLSuperCrudHandler<>(CRUD);
        CrudHandler.postCrud = new MySQLSuperCrudHandler<>(CRUD);
        CrudHandler.replyCrud = new MySQLSuperCrudHandler<>(CRUD);
        CrudHandler.userCrud = new MySQLSuperCrudHandler<>(CRUD);
        CrudHandler.createClassRequestCrud = new MySQLSuperCrudHandler<>(CRUD);
        //创建数据库接口实现
        FLOOR_DAO = (FloorDao)Proxy.newProxyInstance(FloorDaoImpl.class.getClassLoader(), new Class[]{FloorDao.class}, new InterfaceInvokeHandler(new FloorDaoImpl()));
        POST_CLASS_DAO = (PostClassDao)Proxy.newProxyInstance(PostClassDaoImpl.class.getClassLoader(), new Class[]{Database.class, PostClassDao.class}, new InterfaceInvokeHandler(new PostClassDaoImpl()));
        POST_DAO = (PostDao)Proxy.newProxyInstance(PostDaoImpl.class.getClassLoader(), new Class[]{Database.class, PostDao.class}, new InterfaceInvokeHandler(new PostDaoImpl()));
        REPLY_DAO = (ReplyDao)Proxy.newProxyInstance(PostDaoImpl.class.getClassLoader(), new Class[]{Database.class, ReplyDao.class}, new InterfaceInvokeHandler(new ReplyDaoImpl()));
        USER_DAO = (UserDao)Proxy.newProxyInstance(UserDaoImpl.class.getClassLoader(), new Class[]{Database.class, UserDao.class}, new InterfaceInvokeHandler(new UserDaoImpl()));
        CREATE_CLASS_REQUEST_DAO = (CreateClassRequestDao)Proxy.newProxyInstance(CreateClassRequestDaoImpl.class.getClassLoader(), new Class[]{Database.class, CreateClassRequestDao.class}, new InterfaceInvokeHandler(new CreateClassRequestDaoImpl()));
    }

    public static DatabaseCrud getCRUD() {
        return CRUD;
    }

    public static ConnectionManager getConnectionManager() {
        return CONNECTION_MANAGER;
    }

    /**
     *  测试连接
     */
    public static void testConnection(){
        Connection connection;
        try {
            connection = CONNECTION_MANAGER.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            if(connection != null){
                connection.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
