package com.doposts.vo;

import com.doposts.entity.Post;
import com.dxhualuo.database.annotation.FieldMapping;

/**
 * @author xiao yao
 * @date 2020/9/3 15:05
 */
public class SuperPost extends Post {

    /**
     * 用户名字
     */
    @FieldMapping("createUserName")
    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
