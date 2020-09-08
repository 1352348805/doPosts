package com.doposts.log.monitor;

import com.doposts.log.entity.RequesterItem;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 用户日志监控器
 *
 * @author Xiao Jun
 */
public class UserLogMonitor {

    private static UserLogMonitor instance = null;

    public static UserLogMonitor getInstance() {
        if (instance == null) {
            synchronized (UserLogMonitor.class) {
                if (instance == null) {
                    instance = new UserLogMonitor();
                }
            }
        }
        return instance;
    }

    private UserLogMonitor() {}

    /**
     * 用户日志容器
     */
    private Map<String, LinkedList<RequesterItem>> logContainer = new ConcurrentHashMap<>();

    /**
     * 超时阈值 单位:分钟
     */
    private int maxTimeThreshold = 20;

    /**
     * 记录操作日志
     */
    public void recordInLogContainer(RequesterItem item) {
        LinkedList<RequesterItem> items = logContainer.get(item.getId());
        if (items == null) {
            logContainer.put(item.getId(), new LinkedList<>(Arrays.asList(item)));
            return;
        }
        items.addFirst(item);
        logContainer.put(item.getId(),items);
    }

    public Map<String, LinkedList<RequesterItem>> getLogContainer() {
        return logContainer;
    }

    /**
     * 清除不活跃记录
     */
    public void clearInactiveData() {
        logContainer.keySet().forEach(key -> {
            LinkedList<RequesterItem> items = logContainer.get(key);
            if ((System.currentTimeMillis()-items.get(items.size()-1).getRequestTimestamp())/60000.00 > maxTimeThreshold) {
                logContainer.remove(key);
            }
        });
    }
}
