package com.doposts.dao.monitor;

import com.doposts.dao.monitor.entity.InterfaceLogItem;
import com.dxhualuo.data.collection.MappingList;

import java.util.Hashtable;
import java.util.List;
import java.util.Set;

/**
 *  数据库监控器，存放监控信息
 * @author dx_hualuo
 */
public class DatabaseMonitor {
    private DatabaseMonitor(){}
    private static DatabaseMonitor monitor;
    private static boolean dataOutput;
    private static boolean output;

    public static void init(boolean dataOutput, boolean output){
        monitor = new DatabaseMonitor();
        DatabaseMonitor.dataOutput = dataOutput;
        DatabaseMonitor.output = output;
    }
    //********************************************************************************************************非静态区域
    /**
     *  存放DAO层接口日志信息的
     */
    private final Hashtable<String, MappingList<String, InterfaceLogItem>> interfaceLog = new Hashtable<>();
    /**
     *  存放DAO层报错日志信息的
     */
    private final Hashtable<String, MappingList<String, InterfaceLogItem>> interfaceLogError = new Hashtable<>();

    /**
     *  记录Interface被调用的日志
     * @param interfaceName 接口名字
     * @param log 对应接口日志实体
     */
    public static void logInterface(String interfaceName, InterfaceLogItem log){
        if(monitor == null){
            return;
        }
        if(monitor.interfaceLog.containsKey(interfaceName)){
            monitor.interfaceLog.get(interfaceName).put(log.getMethodName(), log);
        }else{
            MappingList<String, InterfaceLogItem> list = new MappingList<>();
            list.put(log.getMethodName(), log);
            monitor.interfaceLog.put(interfaceName, list);
        }
        printLog(interfaceName, log);
    }

    /**
     *  记录Interface被异常的日志
     * @param interfaceName 接口名字
     * @param log 对应接口日志实体
     */
    public static void logErrorInterface(String interfaceName, InterfaceLogItem log){
        if(monitor == null){
            return;
        }
        if(monitor.interfaceLogError.containsKey(interfaceName)){
            monitor.interfaceLogError.get(interfaceName).put(log.getMethodName(), log);
        }else{
            MappingList<String, InterfaceLogItem> list = new MappingList<>();
            list.put(log.getMethodName(), log);
            monitor.interfaceLogError.put(interfaceName, list);
        }
        printErrorLog(interfaceName, log);
    }

    private static void printLog(String interfaceName, InterfaceLogItem log) {
        if(output){
            StringBuilder builder = new StringBuilder();
            builder.append("                         ============》 DX_Database 《============ \n\t数据库接口调用：").append(interfaceName).append("\n");
            builder.append("\t方法名：").append(log.getMethodName()).append("\n");
            builder.append("\t参数：\n").append(log.getParams()==null? "\t\t"+null+"\n": log.getParams());
            builder.append("\t调用位置：").append(log.getLocation()).append("\n");
            if(dataOutput){
                builder.append("\t数据：↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ \n").append(log.getData());
            }
            builder.append("\t耗时：").append(log.getMs()).append("ms").append("\n");
            builder.append("\t时间：").append(log.getTime()).append("\n");
            builder.append("=============================================================================================");
            System.out.println(builder);
        }
    }

    private static void printErrorLog(String interfaceName, InterfaceLogItem log){
        if(output){
            System.out.println("===WARNING===WARNING===WARNING===WARNING===WARNING===WARNING===WARNING===WARNING===WARNING===");
            System.out.println("                           =======》 DX_Database 异常信息 《=======   ");
            StringBuilder builder = new StringBuilder();
            builder.append("\t数据库接口调用：").append(interfaceName).append("\n");
            builder.append("\t方法名：").append(log.getMethodName()).append("\n");
            builder.append("\t参数：\n\t\t").append(log.getParams() == null ? null+ "\n": log.getParams());
            builder.append("\t调用位置：").append(log.getLocation()).append("\n");
            builder.append("\t异常信息：↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ \n");
            System.out.print(builder);
            builder.setLength(0);
            System.out.print("\t\t"+log.getData());
            builder.append("\t时间：").append(log.getTime());
            System.out.println(builder);
            System.out.println("===WARNING===WARNING===WARNING===WARNING===WARNING===WARNING===WARNING===WARNING===WARNING===");
        }
    }

    /**
     *  获得所有的执行异常的接口日志
     * @return 接口日志
     */
    public MappingList<String, InterfaceLogItem> selectErrorLogByInterfaceName(String interfaceName) {
        return interfaceLogError.get(interfaceName);
    }

    /**
     *  获得所有的正常执行的接口日志
     * @return 接口日志
     */
    public MappingList<String, InterfaceLogItem> selectLogByInterfaceName(String interfaceName) {
        return interfaceLog.get(interfaceName);
    }

    /**
     *  获得日志里含有的所有接口的名字
     * @return 名字
     */
    public String[] getLogInterfaceNames(){
        Set<String> strings = interfaceLog.keySet();
        String[] str = new String[strings.size()];
        str = strings.toArray(str);
        return str;
    }

    /**
     *  获得指定interface的异常日志数量
     * @param interfaceName 接口名
     * @return 异常接口名
     */
    public int getInterfaceErrorLogCount(String interfaceName){
        return interfaceLogError.get(interfaceName).valueCount();
    }

    /**
     *  获得指定interface的异常数量
     * @param interfaceName 接口名
     * @return 异常接口名
     */
    public int getInterfaceLogCount(String interfaceName){
        return interfaceLog.get(interfaceName).valueCount();
    }

    /**
     *  查询日志
     * @param interfaceName
     * @return
     */
    public String[] selectLogMethodNamesByInterfaceName(String interfaceName){
        Set<String> strings = interfaceLog.get(interfaceName).keySet();
        String[] str = new String[strings.size()];
        str = strings.toArray(str);
        return str;
    }
}
