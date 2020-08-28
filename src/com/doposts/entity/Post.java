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
    @JSONField(format = "yyyy-MM-dd HH:mm")
    private Date createDate;

    /**
     *  帖子描述
     */
    private String description;

    /**
     *  观看数
     */
    private Integer watchCount;

    public Integer getWatchCount() {
        return watchCount;
    }

    public Post setWatchCount(Integer watchCount) {
        this.watchCount = watchCount;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public Post setDescription(String description) {
        this.description = description;
        return this;
    }

    public Integer getPostId() {
        return postId;
    }

    public Post setPostId(Integer postId) {
        this.postId = postId;
        return this;
    }

    public String getPostName() {
        return postName;
    }

    public Post setPostName(String postName) {
        this.postName = postName;
        return this;
    }

    public Integer getPostClassLevel1Id() {
        return postClassLevel1Id;
    }

    public Post setPostClassLevel1Id(Integer postClassLevel1Id) {
        this.postClassLevel1Id = postClassLevel1Id;
        return this;
    }

    public Integer getPostClassLevel2Id() {
        return postClassLevel2Id;
    }

    public Post setPostClassLevel2Id(Integer postClassLevel2Id) {
        this.postClassLevel2Id = postClassLevel2Id;
        return this;
    }

    public Integer getPostClassLevel3Id() {
        return postClassLevel3Id;
    }

    public Post setPostClassLevel3Id(Integer postClassLevel3Id) {
        this.postClassLevel3Id = postClassLevel3Id;
        return this;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public Post setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
        return this;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public Post setCreateDate(Date createDate) {
        this.createDate = createDate;
        return this;
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
