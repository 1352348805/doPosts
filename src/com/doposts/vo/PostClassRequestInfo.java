package com.doposts.vo;

import com.doposts.entity.CreateClassRequest;

/**
 * 分类申请详情信息
 * @author asuk
 * @date 2020/8/21 21:21
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class PostClassRequestInfo extends CreateClassRequest {

    /**
     * 请求人昵称
     */
    private String requestName;

    /**
     * 父分类名
     */
    private String fatherClassName;

    /**
     * 审核人姓名
     */
    private String reviewerName;

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }

    public String getFatherClassName() {
        return fatherClassName;
    }

    public void setFatherClassName(String fatherClassName) {
        this.fatherClassName = fatherClassName;
    }

    public String getReviewerName() {
        return reviewerName;
    }

    public void setReviewerName(String reviewerName) {
        this.reviewerName = reviewerName;
    }

    @Override
    public String toString() {
        return "PostClassRequestInfo{"  +
                "requestId=" + getRequestId() +
                ", requestUserId=" + getRequestUserId() +
                ", className='" + getClassName() + '\'' +
                ", fatherClassId=" + getFatherClassId() +
                ", requestDate=" + getRequestDate() +
                ", requestName='" + requestName + '\'' +
                ", fatherClassName='" + fatherClassName + '\'' +
                ", reviewerName='" + reviewerName + '\'' +
                '}';
    }
}
