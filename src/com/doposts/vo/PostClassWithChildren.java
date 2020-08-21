package com.doposts.vo;

import com.doposts.entity.PostClass;

import java.util.List;

/**
 * 对分类的扩展,存放与其子分类
 * @author asuk
 * @date 2020/8/19 20:55
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class PostClassWithChildren extends PostClass {

    /**
     * 该分类下的子分类
     */
    List<PostClassWithChildren> children;

    public List<PostClassWithChildren> getChildren() {
        return children;
    }

    public void setChildren(List<PostClassWithChildren> children) {
        this.children = children;
    }
}