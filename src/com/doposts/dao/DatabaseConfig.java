package com.doposts.dao;

import com.dxhualuo.io.Path;
import com.dxhualuo.io.PropertiesManager;

import java.io.IOException;

/**
 *  读取数据库的配置文件
 * @author dx_hualuo
 */
public class DatabaseConfig {
    static{
        //数据库配置文件载入过程
        try {
            PropertiesManager properties = new PropertiesManager(Path.resourcePath("database.properties"));
            url = properties.getValue("url").trim();
            port = Integer.parseInt(properties.getValue("port").trim());
            database = properties.getValue("database").trim();
            userName = properties.getValue("username").trim();
            password = properties.getValue("password").trim();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static String url;
    private static Integer port;
    private static String database;
    private static String userName;
    private static String password;

    public static String getUrl() {
        return url;
    }

    public static void setUrl(String url) {
        DatabaseConfig.url = url;
    }

    public static Integer getPort() {
        return port;
    }

    public static void setPort(Integer port) {
        DatabaseConfig.port = port;
    }

    public static String getDatabase() {
        return database;
    }

    public static void setDatabase(String database) {
        DatabaseConfig.database = database;
    }

    public static String getUserName() {
        return userName;
    }

    public static void setUserName(String userName) {
        DatabaseConfig.userName = userName;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        DatabaseConfig.password = password;
    }
}
