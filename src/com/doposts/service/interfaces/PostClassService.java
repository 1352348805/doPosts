package com.doposts.service.interfaces;

import com.doposts.entity.PostClass;
import com.doposts.to.CommonResult;
import com.doposts.vo.PostClassWithChildren;

import javax.servlet.http.HttpServletRequest;
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
    List<PostClassWithChildren> getMenu(HttpServletRequest request);

    /**
     * 以id删除分类
     * @param id 分类id
     * @return 是否删除成功
     */
    boolean deletePostClassById(int id);

    /**
     * 以分类id获取其子分类的数量
     * @param id 分类id
     * @return 子分类数量
     */
    Integer getPostClassChildrenCountById(int id);

    /**
     * 查询id下一级分类列表
     * @param parentId 父亲id
     * @return  下一级分类列表
     */
    List<PostClass> getCategoryListByParentId(Integer parentId);

    /**
     * 添加分类
     * @param postClass 分类实体
     * @return 是否添加成功
     */
    boolean addPostClass(PostClass postClass);

    /**
     * 检查分类名是否存在
     * @param className 分类名
     * @return 是否存在
     */
    boolean checkClassNameExists(String className);

    /**
     * 获取分类和它的父亲分类
     * @param classId 分类id
     * @return 分类列表
     */
    List<PostClass> getPostClassByIdWithParents(Integer classId);

    /**
     * 以id修改分类
     * @param postClass 分类实体
     * @return 是否修改成功
     */
    boolean modifyPostClass(PostClass postClass);

    /**
     * 根据分类名查询三级分类列表
     * @param name 分类名
     * @return 分类列表
     */
    List<PostClass> getThreePostClassListByName(String name);

    /**
     * 获取一个父分类下的所有三级分类
     * @param parentId
     * @return list
     */
    List<PostClass> getThreePostClassListByParent(Integer parentId);

}
