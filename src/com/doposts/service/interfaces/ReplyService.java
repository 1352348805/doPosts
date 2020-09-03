package com.doposts.service.interfaces;

import com.doposts.entity.Floor;
import com.doposts.entity.Reply;
import com.doposts.vo.FloorWithReply;

/**
 * @author xiao yao
 * @date 2020/8/20 15:18
 */
public interface ReplyService {

    /**
     *   添加回复正文
     * @param reply 回复数据
     * @return 返回id
     */
    Integer insertReple(Reply reply);

}
