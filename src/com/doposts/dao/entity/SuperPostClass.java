package com.doposts.dao.entity;

import com.dxhualuo.database.annotation.PrimaryKey;

/**
 *  递归查询帖子分类的实体类
 * @author dx_hualuo
 */
@SuppressWarnings("unused")
public class SuperPostClass {

    /**
     * 分类id
     */
    public Integer classId;

    /**
     * 分类名称
     */
    public String className;

    /**
     * 分类等级
     */
    public Integer classLevel;

    /**
     * 父级分类
     */
    public SuperPostClass fatherClass;

    @Override
    public String toString() {
        return "SuperPostClass{" +
                "classId=" + classId +
                ", className='" + className + '\'' +
                ", classLevel=" + classLevel +
                ", fatherClass=" + fatherClass +
                '}';
    }
}
