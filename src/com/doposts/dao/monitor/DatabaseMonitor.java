package com.doposts.dao.monitor;

import com.doposts.dao.monitor.entity.InterfaceLogItem;
import com.dxhualuo.data.collection.MappingList;

/**
 *  数据库监控器，存放监控信息
 * @author dx_hualuo
 */
public class DatabaseMonitor {
    private DatabaseMonitor(){}
    private static DatabaseMonitor monitor;
    private static boolean dataOutput;

    public static void init(boolean dataOutput){
        monitor = new DatabaseMonitor();
        DatabaseMonitor.dataOutput = dataOutput;
    }
    //********************************************************************************************************非静态区域
    /**
     *  存放DAO层接口日志信息的
     */
    private final MappingList<String, InterfaceLogItem> interfaceLog = new MappingList<>();

    /**
     *  记录Interface被调用的日志
     * @param interfaceName 接口名字
     * @param log 对应接口日志实体
     */
    public static void logInterface(String interfaceName, InterfaceLogItem log){
        if(monitor == null){
            return;
        }
        monitor.interfaceLog.put(interfaceName, log);
        printLog(interfaceName, log);
    }

    private static void printLog(String interfaceName, InterfaceLogItem log) {
        StringBuilder builder = new StringBuilder();
        builder.append("\n                           ============ DX_Database ============ \n\t数据库调用：").append(interfaceName).append("\n");
        builder.append("\t方法名：").append(log.getMethodName()).append("\n");
        builder.append("\t参数：\n").append(log.getParams());
        builder.append("\t调用位置：").append(log.getLocation()).append("\n");
        if(dataOutput){
            builder.append("\t数据：↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ \n").append(log.getData());
        }
        builder.append("\t耗时：").append(log.getMs()).append("ms").append("\n");
        builder.append("\t时间：").append(log.getTime()).append("\n");
        builder.append("==============================================================================================");
        System.out.println(builder);
    }
}
