package com.doposts.vo;

import com.doposts.entity.Floor;
import com.doposts.entity.Reply;

import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/20 14:40
 */
public class FloorWithReply extends Floor {


    /**
     * 用户名字
     */
    private String userName;

    /**
     * 回复列表的所有数据
     */
    List<Reply> replyList;

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
