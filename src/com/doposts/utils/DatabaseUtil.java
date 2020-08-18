package com.doposts.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author xiaojun
 * 数据库帮助类
 */
public class DatabaseUtil {

    /** 加载属性文件中的数据库配置参数
     * 驱动器
     */
    private static String driver = ConfigManager.getProperty("driver");
    /**
     * 数据库URL
     */
    private static String url= ConfigManager.getProperty("url");

    /**
     * 数据库账号
     */
    private static String user= ConfigManager.getProperty("username");
    /**
     * 数据库密码
     */
    private static String password= ConfigManager.getProperty("password");

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 获取数据库连接对象。
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        // 获取连接并捕获异常
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return conn;// 返回连接对象
    }

    /**
     * 关闭数据库连接。
     *
     * @param conn
     *            数据库连接
     */
    public static void close(Connection conn) {
        // 若数据库连接对象不为空，则关闭
        try {
            if (conn != null && !conn.isClosed())
                conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
