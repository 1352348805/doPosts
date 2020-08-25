package com.doposts.dao.monitor.proxy;

import com.doposts.dao.monitor.DatabaseMonitor;
import com.doposts.dao.monitor.entity.InterfaceLogItem;
import com.dxhualuo.data.annotation.JavaBean;
import com.dxhualuo.io.StringStream;

import java.io.PrintStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.sql.SQLException;
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
        //缓存接口名
        if(interfaceName == null){
            interfaceName = method.getDeclaringClass().getSimpleName();
        }
        //创建日志对象
        InterfaceLogItem log = new InterfaceLogItem();
        //向日志对象添加参数
        if(args != null && args.length > 0){
            StringBuilder builder = new StringBuilder();
            for(Object obj: args){
                builder.append("\t\t").append(obj.toString()).append("\n");
            }
            log.setParams(builder.toString());
        }
        //添加日志时间
        log.setTime(new Date());
        //添加方法名
        log.setMethodName(method.getName());
        //处理调用栈信息，获取方法调用位置
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if(stackTrace.length > 3){
            log.setLocation(stackTrace[3].toString());
        }
        //记录执行耗时
        long time = System.currentTimeMillis();
        //存放方法返回值
        Object returnValue = null;
        try{
            //执行方法
            returnValue = method.invoke(object, args);
        }catch (Exception e){
            StringStream stringStream = new StringStream("\t\t");
            e.printStackTrace(new PrintStream(stringStream));
            StringBuilder builder = new StringBuilder(stringStream.getString());
            log.setData(builder.delete(builder.length()-2, builder.length()).toString());
            DatabaseMonitor.logErrorInterface(interfaceName, log);
            throw new RuntimeException("Dao层异常！异常信息已打印在日志！");
        }
        //计算执行耗时
        time = System.currentTimeMillis() - time;
        //向日志文件添加执行耗时
        log.setMs((short)time);
        //返回值处理，并添加到日志
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
            DatabaseMonitor.logInterface(interfaceName, log);
        }
        return returnValue;
    }
}
