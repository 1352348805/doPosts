package com.doposts.service.interfaces;

import com.doposts.entity.Floor;
import com.doposts.entity.Reply;
import com.doposts.utils.Page;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SuperReply;

import java.util.List;

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


    /**
     * 删除回复
     * @param replyId 主键
     * @return
     */
    boolean deleteReply(Integer replyId);


    /**
     *  用id获取正文
     * @param FloorId 楼层id
     * @return 所有回复信息
     */
    Page<SuperReply> getReplyByFloorId(Integer FloorId, int pageIndex, int pageSize);

}
