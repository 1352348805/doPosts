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
    Integer getPostClasschildrenCountById(int id);

    /**
     * 查询id下一级分类列表
     * @param parentId 父亲id
     * @return  下一级分类列表
     */
    List<PostClass> getCategoryListByParentId(Integer parentId);
}
