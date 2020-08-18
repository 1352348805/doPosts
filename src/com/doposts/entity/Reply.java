package com.doposts.entity;

import com.dxhualuo.database.annotation.AutoIncrement;
import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;

import java.util.Date;

/**
 * 回复实体类
 * @author asuk
 * @date 2020/8/18 15:52
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@TableMapping("reply")
public class Reply {

    /**
     * 回复的绝对id
     */
    @PrimaryKey
    @AutoIncrement
    private Integer replyId;

    /**
     * 回复楼层id
     */
    private Integer floorId;

    /**
     * 回复正文
     */
    private String replyContent;

    /**
     * 正在回复的用户Id
     */
    private Integer replyUserId;

    /**
     * 被回复的用户Id
     */
    private Integer repliedUserId;

    /**
     * 回复的时间
     */
    private Date replyDate;

    /**
     * 回复时使用的图片地址
     */
    private String imageUrl;

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Integer getFloorId() {
        return floorId;
    }

    public void setFloorId(Integer floorId) {
        this.floorId = floorId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Integer getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserId(Integer replyUserId) {
        this.replyUserId = replyUserId;
    }

    public Integer getRepliedUserId() {
        return repliedUserId;
    }

    public void setRepliedUserId(Integer repliedUserId) {
        this.repliedUserId = repliedUserId;
    }

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "replyId=" + replyId +
                ", floorId=" + floorId +
                ", replyContent='" + replyContent + '\'' +
                ", replyUserId=" + replyUserId +
                ", repliedUserId=" + repliedUserId +
                ", replyDate=" + replyDate +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}
