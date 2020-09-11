package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.Floor;
import com.doposts.entity.Post;
import com.doposts.entity.Reply;
import com.doposts.service.interfaces.ReplyService;
import com.doposts.utils.Page;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SuperReply;
import org.jsoup.Connection;

import java.sql.SQLException;

import java.util.List;

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

    /**
     * 删除回复
     *
     * @param replyId 主键
     * @return
     */
    @Override
    public boolean deleteReply(Integer replyId) {
        try {
            return PostItDatabase.getCRUD().executeUpdate("DELETE FROM `reply` WHERE replyId = ?",replyId) > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    /**
     * 用id获取正文
     *
     * @param FloorId  楼层id
     * @param pageIndex
     * @param pageSize
     * @return 所有楼层信息
     */
    @Override
    public Page<SuperReply> getReplyByFloorId(Integer FloorId, int pageIndex, int pageSize) {
        Page<SuperReply> page=new Page<>();
        page.setCurrPageNo(pageIndex);
        page.setPageSize(pageSize);
        page.setTotalCount(PostItDatabase.REPLY_DAO.getFloorCountByPostId(FloorId));
        page.setData(PostItDatabase.REPLY_DAO.getReplyByFloorId(FloorId, page.getOffSet(), page.getPageSize()));
        List<SuperReply> replyByFloorId = PostItDatabase.REPLY_DAO.getReplyByFloorId(FloorId, page.getOffSet(), page.getPageSize());
        return page;
    }

}
