package com.doposts.vo;

/**
 * 帖子查询参数
 * @author asuk
 * @date 2020/8/23 16:09
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class PostQueryParam {

    /**
     * 帖名
     * 查询为：模糊查询
     */
    private String postName;

    /**
     * 创建者人名
     * 查询为：精准查询
     */
    private String createUserName;

    /**
     * 帖子一级分类id
     * 查询为：精准查询
     * 注：查询只带其中一种进行查询
     */
    private Integer postClassLevel1Id;

    /**
     * 帖子二级分类id
     * 查询为：精准查询
     * 注：查询只带其中一种进行查询
     */
    private Integer postClassLevel2Id;

    /**
     * 帖子三级分类id
     * 查询为：精准查询
     * 注：查询只带其中一种进行查询
     */
    private Integer postClassLevel3Id;

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
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

    @Override
    public String toString() {
        System.out.println(super.toString());
        return "PostQueryParam{" +
                "postName='" + postName + '\'' +
                ", createUserName='" + createUserName + '\'' +
                ", postClassLevel1Id=" + postClassLevel1Id +
                ", postClassLevel2Id=" + postClassLevel2Id +
                ", postClassLevel3Id=" + postClassLevel3Id +
                '}';
    }

    public PostQueryParam(){}

    public PostQueryParam(String postName, String createUserName, Integer postClassLevel1Id, Integer postClassLevel2Id, Integer postClassLevel3Id) {
        this.postName = postName;
        this.createUserName = createUserName;
        this.postClassLevel1Id = postClassLevel1Id;
        this.postClassLevel2Id = postClassLevel2Id;
        this.postClassLevel3Id = postClassLevel3Id;
    }
}
