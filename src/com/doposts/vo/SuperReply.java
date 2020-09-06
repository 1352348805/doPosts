package com.doposts.vo;

import com.doposts.entity.Reply;
import com.dxhualuo.database.annotation.FieldMapping;

/**
 * @author xiao yao
 * @date 2020/9/3 15:56
 */
public class SuperReply  extends Reply {

    /**
     * 用户名字
     */
    @FieldMapping("replyUserName")
    private String userName;

    @FieldMapping("replyFavicon")
    private String favicon;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getFavicon() {
        return favicon;
    }

    public void setFavicon(String favicon) {
        this.favicon = favicon;
    }

    @Override
    public String toString() {
        return "SuperReply{" +
                "userName='" + userName + '\'' +
                ", favicon='" + favicon + '\'' +
                '}';
    }
}
