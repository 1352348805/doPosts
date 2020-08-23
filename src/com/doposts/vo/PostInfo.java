package com.doposts.vo;

import com.doposts.entity.Post;

/**
 * 帖子详情信息
 * @author asuk
 * @date 2020/8/23 16:31
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class PostInfo extends Post {

    /**
     * 帖子一级分类名
     */
    private Integer postClassLevel1Name;

    /**
     * 帖子二级分类名
     */
    private Integer postClassLevel2Name;

    /**
     * 帖子三级分类名
     */
    private Integer postClassLevel3Name;

    /**
     * 发帖用户名
     */
    private String createUserName;

    public Integer getPostClassLevel1Name() {
        return postClassLevel1Name;
    }

    public void setPostClassLevel1Name(Integer postClassLevel1Name) {
        this.postClassLevel1Name = postClassLevel1Name;
    }

    public Integer getPostClassLevel2Name() {
        return postClassLevel2Name;
    }

    public void setPostClassLevel2Name(Integer postClassLevel2Name) {
        this.postClassLevel2Name = postClassLevel2Name;
    }

    public Integer getPostClassLevel3Name() {
        return postClassLevel3Name;
    }

    public void setPostClassLevel3Name(Integer postClassLevel3Name) {
        this.postClassLevel3Name = postClassLevel3Name;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }

    @Override
    public String toString() {
        System.out.println(super.toString());
        return "PostInfo{" +
                "postClassLevel1Name=" + postClassLevel1Name +
                ", postClassLevel2Name=" + postClassLevel2Name +
                ", postClassLevel3Name=" + postClassLevel3Name +
                ", createUserName='" + createUserName + '\'' +
                '}';
    }

    public PostInfo() {}

    public PostInfo(Integer postClassLevel1Name, Integer postClassLevel2Name, Integer postClassLevel3Name, String createUserName) {
        this.postClassLevel1Name = postClassLevel1Name;
        this.postClassLevel2Name = postClassLevel2Name;
        this.postClassLevel3Name = postClassLevel3Name;
        this.createUserName = createUserName;
    }
}
