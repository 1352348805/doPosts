package com.doposts.dao.interfaces;

import com.doposts.entity.Floor;
import com.doposts.entity.Reply;

import java.util.List;

/**
 *  回复帖子的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface ReplyDao {
    /**
     * 获取所有回复信息
     * @param floorId 楼层ID
     * @return 回复信息
     */
   List<Reply> getReplyListById(Integer floorId);

    /**
     *   评论回复
     * @param reply 回复数据
     * @return 返回ID
     */
    Integer insertReply(Reply reply);
}
