package com.doposts.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.dxhualuo.data.annotation.JavaBean;
import com.dxhualuo.database.annotation.AutoIncrement;
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
@JavaBean
@TableMapping("post")
public class Post {

    /**
     * 帖子id
     */
    @PrimaryKey
    @AutoIncrement
    private Integer postId;

    /**
     * 帖子名字
     */
    private String postName;

    /**
     * 帖子一级分类id
     */
    private Integer postClassLevel1Id;

    /**
     * 帖子二级分类id
     */
    private Integer postClassLevel2Id;

    /**
     * 帖子三级分类id
     */
    private Integer postClassLevel3Id;

    /**
     * 创建者
     */
    private Integer createUserId;

    /**
     * 创建时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
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

    public Integer getPostClassLevel1Id() {
        return postClassLevel1Id;
    }

    public void setPostClassLevel1Id(Integer postClassLevel1Id) {
        this.postClassLevel1Id = postClassLevel1Id;
    }

    public Integer getPostClassLevel2Id() {
        return postClassLevel2Id;
    }

    public void setPostClassLevel2Id(Integer postClassLevel2Id) {
        this.postClassLevel2Id = postClassLevel2Id;
    }

    public Integer getPostClassLevel3Id() {
        return postClassLevel3Id;
    }

    public void setPostClassLevel3Id(Integer postClassLevel3Id) {
        this.postClassLevel3Id = postClassLevel3Id;
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
                ", postClassLevel1Id=" + postClassLevel1Id +
                ", postClassLevel2Id=" + postClassLevel2Id +
                ", postClassLevel3Id=" + postClassLevel3Id +
                ", createUserId=" + createUserId +
                ", createDate=" + createDate +
                '}';
    }
}
