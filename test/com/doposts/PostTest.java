package com.doposts;

import com.doposts.entity.Floor;
import com.doposts.entity.Post;
import com.doposts.service.impl.FloorServiceImpl;
import com.doposts.service.impl.PostServiceImpl;
import com.doposts.service.interfaces.FloorService;
import com.doposts.service.interfaces.PostService;
import com.doposts.vo.FloorWithReply;
import com.doposts.vo.SelectAllPostAndFloor;
import org.junit.Test;

import java.util.Date;
import java.util.List;

/**
 * @author xiao yao
 * @date 2020/8/20 17:04
 */
public class PostTest {
    private FloorService floorService;
    private PostService postService;
     @Test
    public void f1(){
          floorService=new FloorServiceImpl();
         SelectAllPostAndFloor floorById = floorService.getFloorById(1,0,10);

         List<FloorWithReply> floor = floorById.getFloor();


         floor.forEach(f -> {
             System.out.println("sssssss:"+f.getPostContent());
             f.getReplyList().forEach( r -> {
                 System.out.println("reply："+r);
             });
         });
     }
     @Test
     public void  f2(){
         postService=new PostServiceImpl();
         Post postById = postService.getPostById(2);
         System.out.println(postById);
     }
     @Test
    public  void f3(){
         FloorService floorService=new FloorServiceImpl();
         FloorWithReply floorWithReply = floorService.insertFloor(null);
         if (floorWithReply!=null){
             System.out.println("成功！！！");
         }else {
             System.out.println("失败！！！");
         }
     }

}
