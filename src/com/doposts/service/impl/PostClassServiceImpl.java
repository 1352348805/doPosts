package com.doposts.service.impl;

import com.doposts.dao.PostItDatabase;
import com.doposts.entity.PostClass;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.vo.PostClassWithChildren;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/**
 * @author asuk
 * @date 2020/8/19 15:57
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class PostClassServiceImpl implements PostClassService {

    /**
     * 获取分类菜单
     *
     * @return 菜单数据 当前为一级分类的集合
     */
    @Override
    public List<PostClassWithChildren> getMenu() {
        PostClassWithChildren postClassWithChildren = new PostClassWithChildren();
        fillMenu(0,postClassWithChildren);
        return postClassWithChildren.getChildren();
    }

    /**
     * 以id删除分类
     *
     * @param id 分类id
     * @return 是否删除成功
     */
    @Override
    public boolean deletePostClassById(int id) {
        return PostItDatabase.POST_CLASS_DAO.deletePostClassById(id) > 0 ? true : false;
    }

    /**
     * 以分类id获取其子分类的数量
     *
     * @param id 分类id
     * @return 子分类数量
     */
    @Override
    public Integer getPostClasschildrenCountById(int id) {
        return PostItDatabase.POST_CLASS_DAO.getPostClasschildrenCountById(id);
    }

    /**
     * 递归获取菜单分类
     * @param parentId 父级分类id
     * @param postClassWithChildren 该分类的子分类集合
     */
    private void fillMenu(Integer parentId, PostClassWithChildren postClassWithChildren) {
        AtomicReference<List<PostClassWithChildren>> listAtomicReference = new AtomicReference<>();
        listAtomicReference.set(new ArrayList<>());

        //使用父级id查询子分类
        PostClass postClass = new PostClass();
        postClass.setClassId(parentId);
        List<PostClass> postClassList = PostItDatabase.POST_CLASS_DAO.getSubPostClass(postClass);

        postClassList.forEach(item -> {
            PostClassWithChildren children = new PostClassWithChildren();
            children.setClassId(item.getClassId());
            children.setClassName(item.getClassName());
            children.setClassLevel(item.getClassLevel());
            children.setClassFatherId(item.getClassFatherId());
            fillMenu(item.getClassId(),children);
            listAtomicReference.get().add(children);
        });
        postClassWithChildren.setChildren(listAtomicReference.get());
    }
}
