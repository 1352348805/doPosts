package com.doposts.service.impl;

import com.doposts.constant.SystemConstant;
import com.doposts.dao.PostItDatabase;
import com.doposts.entity.PostClass;
import com.doposts.service.interfaces.PostClassService;
import com.doposts.vo.PostClassWithChildren;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import java.util.concurrent.atomic.AtomicReference;

/**
 * @author asuk
 * @date 2020/8/19 15:57
 * @phone 18579133013
 * @email 1352348805@qq.com
 */
public class PostClassServiceImpl implements PostClassService {

    /**
     * 去缓存中查询菜单分类
     * @return 菜单数据 当前为一级分类的集合
     */
    @Override
    public List<PostClassWithChildren> getMenu(HttpServletRequest request) {
        List<PostClassWithChildren> menu;
        ServletContext application = request.getServletContext();
        Object objMenu =request.getServletContext().getAttribute(SystemConstant.CATEGORY_MENU_KEY);
        //判断上下文中是否存在
        if (objMenu != null) {
            menu = (List<PostClassWithChildren>)objMenu;
        } else {
            menu = this.getMenu();
            //存入上下文
            application.setAttribute(SystemConstant.CATEGORY_MENU_KEY,menu);
        }
        return menu;
    }

    /**
     * ~~~~~~ 该方法暴露是为了方便测试，仅内部调用 ~~~~~~
     * 从数据库获取菜单分类列表
     * @return 菜单数据 当前为一级分类的集合
     */
    @Deprecated
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
    public Integer getPostClassChildrenCountById(int id) {
        return PostItDatabase.POST_CLASS_DAO.getPostClasschildrenCountById(id);
    }

    /**
     * 查询id下一级分类列表
     *
     * @param parentId 父亲id
     * @return 下一级分类列表
     */
    @Override
    public List<PostClass> getCategoryListByParentId(Integer parentId) {
        PostClass postClass = new PostClass();
        postClass.setClassId(parentId);
        return  PostItDatabase.POST_CLASS_DAO.getSubPostClass(postClass);
    }

    /**
     * 添加分类
     *
     * @param postClass 分类实体
     * @return 是否添加成功
     */
    @Override
    public boolean addPostClass(PostClass postClass) {

        return PostItDatabase.POST_CLASS_DAO.insertPostClass(postClass) > 0;
    }

    /**
     * 检查分类名是否存在
     *
     * @param className 分类名
     * @return 是否存在
     */
    @Override
    public boolean checkClassNameExists(String className) {
        return PostItDatabase.POST_CLASS_DAO.findPostClassByClassName(className) != null;
    }

    /**
     * 获取分类和它的父亲分类
     *
     * @param classId 分类id
     * @return 分类列表
     */
    @Override
    public List<PostClass> getPostClassByIdWithParents(Integer classId) {
        List<PostClass> postClassList = new ArrayList<>();
        getPostClassByIdWithParents(classId,postClassList);
        return postClassList;
    }

    /**
     * 以id修改分类
     *
     * @param postClass 分类实体
     * @return 是否修改成功
     */
    @Override
    public boolean modifyPostClass(PostClass postClass) {
        return PostItDatabase.POST_CLASS_DAO.updatePostClassById(postClass) > 0;
    }

    /**
     * 根据分类名查询三级分类列表
     *
     * @param name 分类名
     * @return 分类列表
     */
    @Override
    public List<PostClass> getThreePostClassListByName(String name) {
        return PostItDatabase.POST_CLASS_DAO.getPostClassListByCondition(name,3);
    }

    /**
     * 获取一个父分类下的所有三级分类
     *
     * @param parentId
     * @return list
     */
    @Override
    public List<PostClass> getThreePostClassListByParent(Integer parentId) {
        List<PostClass> list = new ArrayList<>();
        getThreePostClassListByParent(parentId,list);
        return list;
    }

    /**
     * 获取一个父分类下的所有三级分类
     * @param parentId
     * @param list
     */
    private void getThreePostClassListByParent(Integer parentId, List<PostClass> list) {
        List<PostClass> postClassList = getCategoryListByParentId(parentId);
        postClassList.forEach(item -> {
            getThreePostClassListByParent(item.getClassId(),list);
            if (item.getClassLevel() == 3) {
                list.add(item);
            }
        });

    }

    /**
     * 获取分类和它的父亲分类
     * @param classId 当前分类id
     * @param postClassList 需要填充的集合
     */
    private void getPostClassByIdWithParents(Integer classId, List<PostClass> postClassList) {
        PostClass postClass = PostItDatabase.POST_CLASS_DAO.getPostClassById(classId);
        if (postClass == null) {
            return;
        }
        getPostClassByIdWithParents(postClass.getClassFatherId(),postClassList);
        postClassList.add(postClass);
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
