package com.doposts.dao.monitor.servlet;

import com.doposts.servlet.AbstractServlet;

import javax.servlet.annotation.WebServlet;

/**
 *  网页上的数据库调用接口
 * @author dx_hualuo
 */
@WebServlet("/database")
public class DatabaseInterfaces extends AbstractServlet {
    @Override
    public Class<?> getServletClass() {
        return this.getClass();
    }

    
}
