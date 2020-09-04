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

    @FieldMapping("createFavicon")
    private String favicon;

    public String getFavicon() {
        return favicon;
    }

    public void setFavicon(String favicon) {
        this.favicon = favicon;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "SuperPost{" +
                "userName='" + userName + '\'' +
                '}';
    }

}
