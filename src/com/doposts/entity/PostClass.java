package com.doposts.entity;

import com.dxhualuo.database.annotation.PrimaryKey;
import com.dxhualuo.database.annotation.TableMapping;

/**
 * 帖子分类实体类
 * @author asuk
 * @date 2020/8/18 15:39
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
@TableMapping("post_classification")
public class PostClass {

    /**
     * 分类id
     */
    @PrimaryKey
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
}
