package com.doposts.log.entity;

import java.util.Map;

/**
 * @author Xiao Jun
 */
public class RequesterItem {

    //用户id UUID为未登录用户
    private String id;
    //用户ip
    private String ip;
    //请求的URL
    private String requestUri;
    //请求的时间戳
    private long requestTimestamp;
    //请求的参数
    private Map<String,String[]> requestParameterMap;
    //上一个URL
    private String referer;
    //用户软件信息
    private String userAgent;

    public long getRequestTimestamp() {
        return requestTimestamp;
    }

    public RequesterItem setRequestTimestamp(long requestTimestamp) {
        this.requestTimestamp = requestTimestamp;
        return this;
    }

    public String getId() {
        return id;
    }

    public RequesterItem setId(String id) {
        this.id = id;
        return this;
    }

    public String getIp() {
        return ip;
    }

    public RequesterItem setIp(String ip) {
        this.ip = ip;
        return this;
    }

    public String getRequestUri() {
        return requestUri;
    }

    public RequesterItem setRequestUri(String requestUri) {
        this.requestUri = requestUri;
        return this;
    }

    public Map<String, String[]> getRequestParameterMap() {
        return requestParameterMap;
    }

    public RequesterItem setRequestParameterMap(Map<String, String[]> requestParameterMap) {
        this.requestParameterMap = requestParameterMap;
        return this;
    }

    public String getReferer() {
        return referer;
    }

    public RequesterItem setReferer(String referer) {
        this.referer = referer;
        return this;
    }

    public String getUserAgent() {
        return userAgent;
    }

    public RequesterItem setUserAgent(String userAgent) {
        this.userAgent = userAgent;
        return this;
    }

}
