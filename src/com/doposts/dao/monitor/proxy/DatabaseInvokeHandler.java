package com.doposts.dao.monitor.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/**
 * 监控数据库层调用的SQL语句
 * @author dx_hualuo
 */
public class DatabaseInvokeHandler implements InvocationHandler {
    Object object;
    String interfaceName;

    public DatabaseInvokeHandler(Object obj){
        this.object = obj;
    }


    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if(interfaceName == null){
            interfaceName = proxy.getClass().getInterfaces()[0].getName();
        }

        return null;
    }
}
