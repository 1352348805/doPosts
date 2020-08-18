package com.doposts.entity;

import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;

import java.util.Date;

/**
 *  创建分类请求
 * @author dx_hualuo
 */
@TableMapping("create_class_request")
public class CreateClassRequest {
    /**
     *  新建分类请求的绝对id
     */
    @PrimaryKey
    private Integer requestId;
    /**
     *  请求新建分类的用户id
     */
    private Integer requestUserId;
    /**
     *  分类名
     */
    private String className;
    /**
     *  父级分类Id
     */
    private Integer fatherClassId;
    /**
     *  请求时间
     */
    private Date requestDate;

    public Integer getRequestId() {
        return requestId;
    }

    public void setRequestId(Integer requestId) {
        this.requestId = requestId;
    }

    public Integer getRequestUserId() {
        return requestUserId;
    }

    public void setRequestUserId(Integer requestUserId) {
        this.requestUserId = requestUserId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Integer getFatherClassId() {
        return fatherClassId;
    }

    public void setFatherClassId(Integer fatherClassId) {
        this.fatherClassId = fatherClassId;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    @Override
    public String toString() {
        return "CreateClassRequest{" +
                "requestId=" + requestId +
                ", requestUserId=" + requestUserId +
                ", className='" + className + '\'' +
                ", fatherClassId=" + fatherClassId +
                ", requestDate=" + requestDate +
                '}';
    }
}
