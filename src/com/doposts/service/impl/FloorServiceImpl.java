package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.impl.ReplyDaoImpl;
import com.doposts.dao.interfaces.ReplyDao;
import com.doposts.entity.Floor;
import com.doposts.entity.Reply;
import com.doposts.service.interfaces.FloorService;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SelectAllPostAndFloor;
import com.mchange.v1.util.Sublist;

import java.util.ArrayList;
import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/20 15:19
 */
public class FloorServiceImpl  implements FloorService {
    /**
     * 用id获取正文
     *
     * @param postId 帖子id
     * @return 所有楼层信息
     */
    @Override
    public SelectAllPostAndFloor getFloorById(Integer postId) {
        //创建一个加强类
        SelectAllPostAndFloor selectAllPostAndFloor=new SelectAllPostAndFloor();
        //创建一个Floor加强类
        List<FloorWithReply> floorWithReplies = new ArrayList<>();
        //拿到数据库返回楼层的数据
        List<Floor> floorById = PostItDatabase.FLOOR_DAO.getFloorByPostId(postId);
        //拿到数据库返回的回复数据
        ReplyDao dao=new ReplyDaoImpl();
        List<Reply> replyList=new ArrayList<>();
        //循环遍历把Floor里的数据转换到Floor加强类里
        for (Floor floor: floorById) {
            FloorWithReply floorWithReply = new FloorWithReply();
            floorWithReply.setFloorId(floor.getFloorId());
            floorWithReply.setPostId(floor.getPostId());
            floorWithReply.setPostFloor(floor.getPostFloor());
            floorWithReply.setPostContent(floor.getPostContent());
            floorWithReply.setCreateUserId(floor.getCreateUserId());
            floorWithReply.setSendDate(floor.getSendDate());
            floorWithReply.setImageUrl(floor.getImageUrl());
          //拿到每一楼的回复信息
            replyList  =  PostItDatabase.REPLY_DAO.getReplyListById(floorWithReply.getFloorId());
            //把回复数据装进当前楼的List里
            floorWithReply.setReplyList(replyList);
            floorWithReplies.add(floorWithReply);


        }
        selectAllPostAndFloor.setFloor(floorWithReplies);
        return selectAllPostAndFloor ;
    }
}
