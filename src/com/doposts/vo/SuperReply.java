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

    @FieldMapping("repliedUserName")
    private String repliedUserName;

    @FieldMapping("replyFavicon")
    private String favicon;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRepliedUserName() {
        return repliedUserName;
    }

    public void setRepliedUserName(String repliedUserName) {
        this.repliedUserName = repliedUserName;
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
                ", repliedUserName='" + repliedUserName + '\'' +
                ", favicon='" + favicon + '\'' +
                '}';
    }
}
