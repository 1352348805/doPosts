package com.doposts;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.monitor.DatabaseMonitorServlet;
import com.doposts.entity.PostClass;
import com.doposts.vo.PostInfo;
import com.doposts.vo.PostQueryParam;

import java.util.List;

/**
 *  测试用的主方法
 * @author dx_hualuo
 */
@SuppressWarnings("RedundantThrows")
public class Run {
    public static void main(String[] args) throws Exception{
        DatabaseMonitorServlet monitorServlet = new DatabaseMonitorServlet();
        monitorServlet.init();
        PostItDatabase.POST_CLASS_DAO.getPostClasschildrenCountById(1);
        PostItDatabase.POST_CLASS_DAO.getOneLevelPostClass();
        PostItDatabase.POST_CLASS_DAO.findPostClassByClassName("影");
        PostItDatabase.POST_CLASS_DAO.getSubPostClass(new PostClass().setClassId(1));
        PostItDatabase.POST_CLASS_DAO.getPostClasschildrenCountById(1);
        PostItDatabase.POST_CLASS_DAO.insertPostClass(
                new PostClass().
                        setClassFatherId(13).
                        setClassName("樱花庄的宠物女孩").
                        setClassLevel(3).
                        setClassDescribe("作品主要讲述了就读水明艺术大学附属高中的神田空太，一年级的夏天时在宿舍中养猫，而被校长叫去问话，校长让他在丢掉猫与从此搬到\"樱花庄\"中作选择。身为爱猫一族的空太，暂时选择了流落到因聚集各种怪人而恶名昭著的“樱花庄”。 隔年春天，随着世界级天才画家椎名真白搬进了樱花庄，神田空太开始过起被这名缺乏常识的少女耍得团团转的日子。").
                        setImageUrl("/static/images/classImage/樱花庄的宠物女孩.jpg")
        );
        PostItDatabase.POST_CLASS_DAO.getOneLevelPostClass();
    }
}