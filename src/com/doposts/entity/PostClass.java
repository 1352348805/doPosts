package com.doposts.entity;

import com.dxhualuo.data.annotation.JavaBean;
import com.dxhualuo.database.annotation.AutoIncrement;
import com.dxhualuo.database.annotation.FieldMapping;
import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;

/**
 * 帖子分类实体类
 * @author asuk
 * @date 2020/8/18 15:39
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@JavaBean
@TableMapping("post_classification")
public class PostClass {

    /**
     * 分类id
     */
    @PrimaryKey
    @AutoIncrement
    private Integer classId;

    /**
     * 分类名称
     */
    private String className;

    /**
     * 分类等级
     */
    private Integer classLevel;

    /**
     * 父级分类id
     */
    private Integer classFatherId;

    /**
     * 分类描述
     */
    private String classDescribe;

    /**
     * 是否启用 0:未启用 1:启用
     */
    private Boolean isEnable;

    /**
     *  分类图片
     */
    @FieldMapping("classImageUrl")
    private String imageUrl;

    public Integer getClassId() {
        return classId;
    }

    public PostClass setClassId(Integer classId) {
        this.classId = classId;
        return this;
    }

    public String getClassName() {
        return className;
    }

    public PostClass setClassName(String className) {
        this.className = className;
        return this;
    }

    public Integer getClassLevel() {
        return classLevel;
    }

    public PostClass setClassLevel(Integer classLevel) {
        this.classLevel = classLevel;
        return this;
    }

    public Integer getClassFatherId() {
        return classFatherId;
    }

    public String getClassDescribe() {
        return classDescribe;
    }

    public PostClass setClassDescribe(String classDescribe) {
        this.classDescribe = classDescribe;
        return this;
    }

    public Boolean getEnable() {
        return isEnable;
    }

    public PostClass setEnable(Boolean enable) {
        isEnable = enable;
        return this;
    }

    public PostClass setClassFatherId(Integer classFatherId) {
        this.classFatherId = classFatherId;
        return this;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public PostClass setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
        return this;
    }

    @Override
    public String toString() {
        return "PostClass{" +
                "classId=" + classId +
                ", className='" + className + '\'' +
                ", classLevel=" + classLevel +
                ", classFatherId=" + classFatherId +
                ", classDescribe='" + classDescribe + '\'' +
                ", isEnable=" + isEnable +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }

    public PostClass() {

    }

    public PostClass(Integer classId, String className, Integer classLevel, Integer classFatherId) {
        this.classId = classId;
        this.className = className;
        this.classLevel = classLevel;
        this.classFatherId = classFatherId;
    }

    public PostClass(Integer classId, String className, Integer classLevel, Integer classFatherId, String classDescribe) {
        this.classId = classId;
        this.className = className;
        this.classLevel = classLevel;
        this.classFatherId = classFatherId;
        this.classDescribe = classDescribe;
    }
}
