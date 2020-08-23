package com.doposts.dao.monitor.proxy;

import com.doposts.dao.monitor.DatabaseMonitor;
import com.doposts.dao.monitor.entity.InterfaceLogItem;
import com.dxhualuo.data.annotation.JavaBean;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

/**
 *  监控各个数据库接口方法调用耗时以及调用次数
 * @author dx_hualuo
 */
public class InterfaceInvokeHandler implements InvocationHandler {
    Object object;
    String interfaceName;

    public InterfaceInvokeHandler(Object obj){
        this.object = obj;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if(interfaceName == null){
            interfaceName = method.getDeclaringClass().getSimpleName();
        }
        InterfaceLogItem log = new InterfaceLogItem();
        if(args != null && args.length > 0){
            StringBuilder builder = new StringBuilder();
            for(Object obj: args){
                builder.append("\t\t").append(obj.toString()).append("\n");
            }
            log.setParams(builder.toString());
        }
        log.setTime(new Date());
        long time = System.currentTimeMillis();
        Object returnValue = method.invoke(object, args);
        time = System.currentTimeMillis() - time;
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if(stackTrace.length > 3){
            log.setLocation(stackTrace[3].toString());
        }
        log.setMs((short)time);
        log.setMethodName(method.getName());
        if(returnValue != null){
            if(returnValue instanceof List){
                StringBuilder builder = new StringBuilder();
                for (Object obj: (List<?>)returnValue) {
                    builder.append("\t\t").append(obj.toString()).append("\n");
                }
                log.setData(builder.toString());
            }else if(returnValue.getClass().getAnnotation(JavaBean.class) != null){
                log.setData("\t\t"+returnValue.toString()+"\n");
            }else{
                log.setData("\t\t"+returnValue.toString()+"\n");
            }
        }
        DatabaseMonitor.logInterface(interfaceName, log);
        return returnValue;
    }
}
