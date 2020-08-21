package com.doposts.entity;

import com.dxhualuo.database.annotation.AutoIncrement;
import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;
import com.sun.org.apache.xpath.internal.operations.Bool;

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
    @AutoIncrement
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
    /**
     *  是否被处理 0 未处理 1 已处理
     */
    private Boolean isProcess;

    /**
     *  是否通过 0 未通过 1 已通过
     */
    private Boolean isPass;

    /**
     *  审核人ID
     */
    private Integer reviewerId;

    /**
     *  审核日期
     */
    private Date reviewDate;

    public Boolean getIsPass() {
        return isPass;
    }

    public void setIsPass(Boolean pass) {
        isPass = pass;
    }

    public Integer getReviewerId() {
        return reviewerId;
    }

    public void setReviewerId(Integer reviewerId) {
        this.reviewerId = reviewerId;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    public Boolean getIsProcess() {
        return isProcess;
    }

    public void setIsProcess(Boolean process) {
        isProcess = process;
    }

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
