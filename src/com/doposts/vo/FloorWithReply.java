package com.doposts.vo;

import com.doposts.entity.Floor;
import com.doposts.entity.Reply;

import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/20 14:40
 */
public class FloorWithReply extends Floor {


    List<Reply> replyList;

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }
}
