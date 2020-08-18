package com.doposts.entity;

import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;

import java.util.Date;

/**
 * 楼层实体类
 * @author asuk
 * @date 2020/8/18 15:44
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@TableMapping("floor")
public class Floor {

    /**
     * 楼层id
     */
    @PrimaryKey
    private Integer floorId;

    /**
     * 帖子id
     */
    private Integer postId;

    /**
     * 所在的楼层
     */
    private Integer postFloor;

    /**
     * 楼层正文
     */
    private String postContent;

    /**
     * 发送时间
     */
    private Date sendDate;

    /**
     * 图片地址
     */
    private String imageUrl;

    public Integer getFloorId() {
        return floorId;
    }

    public void setFloorId(Integer floorId) {
        this.floorId = floorId;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getPostFloor() {
        return postFloor;
    }

    public void setPostFloor(Integer postFloor) {
        this.postFloor = postFloor;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Floor{" +
                "floorId=" + floorId +
                ", postId=" + postId +
                ", postFloor=" + postFloor +
                ", postContent='" + postContent + '\'' +
                ", sendDate=" + sendDate +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}
