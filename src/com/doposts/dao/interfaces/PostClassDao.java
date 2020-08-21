package com.doposts.dao.interfaces;

import com.doposts.entity.PostClass;
import java.util.List;

/**
 *  帖子分类的接口，在此添加方法以实现接口
 * @author dx_hualuo
 */
public interface PostClassDao {
    /**
     *  获得一级分类
     * @return SuperPostClass
     */
    List<PostClass> getOneLevelPostClass();

    /**
     *  获得一个分类的子分类
     * @param postClass 分类
     * @return 子分类列表
     */
    List<PostClass> getSubPostClass(PostClass postClass);

    /**
     *  获得指定Id的分类
     * @param id id
     * @return 分类
     */
    PostClass getPostClassById(int id);

    /**
     * 删除指定id的分类
     * @param id id
     * @return 受影响的行数
     */
    Integer deletePostClassById(int id);

    /**
     * 以分类id获取其子分类的记录数
     * @param id id
     * @return  记录数
     */
    Integer getPostClasschildrenCountById(int id);

    /**
     * 插入分类记录
     * @param postClass 插入的实体
     * @return  受影响的行数
     */
    Integer insertPostClass(PostClass postClass);

    /**
     * 查询分类名相同的记录数
     * @param className 要查询的分类名
     * @return 记录数
     */
    Integer findPostClassByClassName(String className);

    /**
     * 以id更新分类
     * @param postClass 分类实体，其中属性值为空的字段无需参与更新
     * @return 受影响的行数
     */
    Integer updatePostClassById(PostClass postClass);

    /**
     * 根据分类名和分类等级查询分类列表
     * @param className 查询的分类名
     * @param classLevel 查询的分类等级
     * @return 分类集合
     */
    List<PostClass> getPostClassListByCondition(String className,Integer classLevel);
}
