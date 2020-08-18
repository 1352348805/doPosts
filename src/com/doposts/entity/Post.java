package com.doposts.entity;

import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;

import java.util.Date;

/**
 * 帖子实体类
 * @author asuk
 * @date 2020/8/18 15:48
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@TableMapping("post")
public class Post {

    /**
     * 帖子id
     */
    @PrimaryKey
    private Integer postId;

    /**
     * 帖子名字
     */
    private String postName;

    /**
     * 帖子分类id
     */
    private Integer postClassId;

    /**
     * 创建者
     */
    private Integer createUserId;

    /**
     * 创建时间
     */
    private Date createDate;

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public Integer getPostClassId() {
        return postClassId;
    }

    public void setPostClassId(Integer postClassId) {
        this.postClassId = postClassId;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postId=" + postId +
                ", postName='" + postName + '\'' +
                ", postClassId=" + postClassId +
                ", createUserId=" + createUserId +
                ", createDate=" + createDate +
                '}';
    }
}
