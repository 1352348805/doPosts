package com.doposts.dao;

import com.dxhualuo.data.annotation.JavaBean;

@JavaBean
public class Count {
    private Long count;

    public Long getCount() {
        return count;
    }

    public Count setCount(Long count) {
        this.count = count;
        return this;
    }
}
