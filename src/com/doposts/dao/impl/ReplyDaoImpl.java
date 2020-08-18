package com.doposts.dao.impl;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.interfaces.ReplyDao;
import com.dxhualuo.database.impl.MySQL_C3P0;

/**
 *  回复的消息DAO的实现
 * @author dx_hualuo
 */
public class ReplyDaoImpl extends MySQL_C3P0<ReplyDaoImpl> implements ReplyDao {
    public ReplyDaoImpl(){
        super("post");
    }


}
