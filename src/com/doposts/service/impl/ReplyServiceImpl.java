package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.Floor;
import com.doposts.entity.Reply;
import com.doposts.service.interfaces.ReplyService;
import com.doposts.vo.FloorWithReply;
import org.jsoup.Connection;

/**
 * @author xiao yao
 * @date 2020/8/20 15:19
 */
public class ReplyServiceImpl implements ReplyService {



    /**
     * 添加回复正文
     *
     * @param reply 回复数据
     * @return 受影响的行数
     */
    @Override
    public Integer insertReple(Reply reply) {
        return  PostItDatabase.REPLY_DAO.insertReply(reply);
    }
}
