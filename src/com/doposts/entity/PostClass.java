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

    public Boolean getEnable() {
        return isEnable;
    }

    public void setEnable(Boolean enable) {
        isEnable = enable;
    }

    public String getClassDescribe() {
        return classDescribe;
    }

    public void setClassDescribe(String classDescribe) {
        this.classDescribe = classDescribe;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Integer getClassLevel() {
        return classLevel;
    }

    public void setClassLevel(Integer classLevel) {
        this.classLevel = classLevel;
    }

    public Integer getClassFatherId() {
        return classFatherId;
    }

    public void setClassFatherId(Integer classFatherId) {
        this.classFatherId = classFatherId;
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
