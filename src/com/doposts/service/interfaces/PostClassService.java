package com.doposts.service.interfaces;

import com.doposts.vo.PostClassWithChildren;

import java.util.List;

/**
 * @author asuk
 * @date 2020/8/19 15:55
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public interface PostClassService {


    /**
     * 获取分类菜单
     * @return 菜单数据,一级分类的集合
     */
    List<PostClassWithChildren> getMenu();
}
