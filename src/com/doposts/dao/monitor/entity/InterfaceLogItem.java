package com.doposts.dao.monitor.entity;

import java.util.Date;

/**
 *  InterfaceLogItem实体类
 * @author dx_hualuo
 */
public class InterfaceLogItem {
    /**
     *  调用方法的地址
     */
    String location;
    /**
     *  被调用方法名
     */
    String methodName;
    /**
     *  访问接口时的参数
     */
    String params;
    /**
     *  访问时间
     */
    Date time;

    /**
     *  返回的数据
     */
    String data;
    /**
     *  用时ms
     */
    short ms;

    public String getMethodName() {
        return methodName;
    }

    public String getData() {
        return data;
    }

    public InterfaceLogItem setData(String data) {
        this.data = data;
        return this;
    }

    public InterfaceLogItem setMethodName(String methodName) {
        this.methodName = methodName;
        return this;
    }

    public String getLocation() {
        return location;
    }

    public InterfaceLogItem setLocation(String location) {
        this.location = location;
        return this;
    }

    public String getParams() {
        return params;
    }

    public InterfaceLogItem setParams(String params) {
        this.params = params;
        return this;
    }

    public Date getTime() {
        return time;
    }

    public InterfaceLogItem setTime(Date time) {
        this.time = time;
        return this;
    }

    public short getMs() {
        return ms;
    }

    public InterfaceLogItem setMs(short ms) {
        this.ms = ms;
        return this;
    }
}
