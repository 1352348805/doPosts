package com.doposts.dao;

import com.dxhualuo.data.annotation.JavaBean;

@JavaBean
public class Count {
    private Integer count;

    public Integer getCount() {
        return count;
    }

    public Count setCount(Integer count) {
        this.count = count;
        return this;
    }
}
