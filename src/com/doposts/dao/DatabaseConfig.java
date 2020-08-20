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
            URL = properties.getValue("url").trim();
            PORT = Integer.parseInt(properties.getValue("port").trim());
            DATABASE = properties.getValue("database").trim();
            USER_NAME = properties.getValue("username").trim();
            PASSWORD = properties.getValue("password").trim();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private final static String URL;
    private final static Integer PORT;
    private final static String DATABASE;
    private final static String USER_NAME;
    private final static String PASSWORD;

    public static String getUrl() {
        return URL;
    }

    public static Integer getPort() {
        return PORT;
    }

    public static String getDatabase() {
        return DATABASE;
    }

    public static String getUserName() {
        return USER_NAME;
    }

    public static String getPassword() {
        return PASSWORD;
    }
}
