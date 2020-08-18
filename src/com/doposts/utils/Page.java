package com.doposts.utils;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author xiao jun
 * 分页 PageBean
 * @param <T>
 */
public class Page<T> {
    /**
     *     总页数
     */
    private int totalPageCount = 0;
    /**
     * 页面大小，即每页显示记录数
     */
    private int pageSize = 5;
    /**
     * 记录总数
     */
    private int totalCount;
    /**
     * 当前页码
     */
    private int currPageNo = 1;
    /**
     * 每页数据集合
     */
    private List<T> data;

    public int getCurrPageNo() {
        if (totalPageCount == 0)
            return 0;
        return currPageNo;
    }

    public void setCurrPageNo(int currPageNo) {
        if (currPageNo > 0)
            this.currPageNo = currPageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        if (pageSize > 0)
            this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        if (totalCount > 0) {
            this.totalCount = totalCount;
            // 计算总页数
            totalPageCount = this.totalCount % pageSize == 0 ? (this.totalCount / pageSize)
                    : (this.totalCount / pageSize + 1);
        }
    }

    public int getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    /**
     * 获取数据库偏移量（limit启始位置）
     * @return 偏移量
     */
    public Integer getOffSet() {
        return (currPageNo - 1) * pageSize;
    }

    /**
     * 前台传来的页码类型转换
     * @param req
     * @param param
     * @return
     */
    public static Integer parseIntPageIndex(HttpServletRequest req, String param) {
        String index = req.getParameter(param);
        Integer i;
        try {
            i = Integer.parseInt(index);
        } catch (Exception e) {
            i = 0;
        }
        return i;
    }
}
