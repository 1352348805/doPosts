package com.doposts.dao;

import com.doposts.entity.*;
import com.dxhualuo.database.handler.MySQLSuperCrudHandler;
import com.dxhualuo.database.handler.interfaces.SuperCrud;

/**
 *  CRUD处理器
 * @author dx_hualuo
 */
public class CrudHandler {
    public static SuperCrud<Floor> floorCrud;
    public static SuperCrud<PostClass> postClassCrud;
    public static SuperCrud<Post> postCrud;
    public static SuperCrud<Reply> replyCrud;
    public static SuperCrud<User> userCrud;
    public static SuperCrud<CreateClassRequest> createClassRequestCrud;
}
