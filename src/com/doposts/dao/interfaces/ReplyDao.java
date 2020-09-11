package com.doposts.dao.interfaces;

import com.doposts.entity.Floor;
import com.doposts.entity.Reply;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SuperReply;

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
   List<SuperReply> getReplyListById(Integer floorId);

    /**
     *   评论回复
     * @param reply 回复数据
     * @return 返回ID
     */
    Integer insertReply(Reply reply);


    /**
     *  用id获取正文
     * @param FloorId 楼层id
     * @return 所有楼层信息
     */

    List<SuperReply>  getReplyByFloorId(Integer FloorId, int offset, int pageSize);


   /**
     * 根据帖子id获取所有现有的回复数
     *
     * @param FloorId 帖子id
     * @return 数量
     */
   Integer getFloorCountByPostId(int FloorId);


    Integer deleteReplyByUserId(int id);
}
