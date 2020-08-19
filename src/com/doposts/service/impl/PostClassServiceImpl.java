package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.dao.entity.SuperPostClass;
import com.doposts.service.PostClassService;

/**
 * @author asuk
 * @date 2020/8/19 15:57
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class PostClassServiceImpl implements PostClassService {


    /**
     * 获得所有分类
     *
     * @return SuperPostClass
     */
    @Override
    public SuperPostClass getAllPostClass() {
        return PostItDatabase.POST_CLASS_DAO.getAllPostClass();
    }
}
