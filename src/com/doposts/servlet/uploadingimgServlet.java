package com.doposts.servlet;

import com.alibaba.druid.util.JdbcUtils;
import com.doposts.dao.PostItDatabase;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author xiao yao
 * @date 2020/8/28 19:41
 */
@WebServlet("/uploadingimg")
public class uploadingimgServlet extends AbstractServlet {

    private static final String imgDirUrl = "/static/images/";

    class UploadBean {
        Integer errno;
        List<String> data;

        public Integer getErrno() {
            return errno;
        }

        public void setErrno(Integer errno) {
            this.errno = errno;
        }

        public List<String> getData() {
            return data;
        }

        public void setData(List<String> data) {
            this.data = data;
        }
    }

    @Override
    public Class<?> getServletClass() {
        return uploadingimgServlet.class;
    }

    private static final long serialVersionUID = 1L;

    public uploadingimgServlet() {
        super();
    }

    public UploadBean uploadingimgs(HttpServletRequest request, HttpServletResponse response){
        UploadBean uploadBean = new UploadBean();
        List<String> imgs = new ArrayList<>();
        //图片存放路径
        String relpath="static/images";
        System.out.println(relpath);
        String path=request.getServletContext().getRealPath(relpath);
        System.out.println(path);
        String fn=null;

        DiskFileItemFactory factory=new DiskFileItemFactory();

        ServletFileUpload sfu=new ServletFileUpload(factory);

        sfu.setHeaderEncoding("UTF-8");  //处理中文问题

        sfu.setSizeMax(1024*1024*10);   //限制文件大小

        try {
            List<FileItem> fileItems= sfu.parseRequest(request);  //解码请求 得到所有表单元素
            for (FileItem fi : fileItems) {
                //有可能是 文件，也可能是普通文字
                if (fi.isFormField()) { //这个选项是 文字
                    System.out.println("表单值为："+fi.getString());
                }else{
                    // 是文件
                    //获取图片后缀名
                    String format=fi.getName().substring(fi.getName().indexOf("."), fi.getName().length());
                    System.out.println(format);
                    //图片命名
                    fn= UUID.randomUUID().toString().replaceAll("-", "")+format;
                    System.out.println("文件名是："+fn);  //文件名
                    // fn 是可能是这样的 c:\abc\de\tt\fish.jpg
                    fi.write(new File(path,fn));
                    uploadBean.setErrno(0);
                    imgs.add(request.getContextPath() + imgDirUrl + fn);
                }
            }
            uploadBean.setData(imgs);

        } catch (Exception e) {
            uploadBean.setErrno(1);
            e.printStackTrace();
        }
        
//        String imgpath="upimgs/"+fn;
//        //保存数据库的是相对路径
//        JdbcUtils jdbcUtils = new JdbcUtils();
//        jdbcUtils.getConnection();
//
//        String sql="insert into  img (src) values(?)";
//        List<Object> param=new ArrayList<Object>();
//        param.add(imgpath);
//
//        int r=-1;
//        try {
//            r = jdbcUtils.updateByPreparedStatement(sql, param);
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }

        //去显示上传的文件

//        request.getRequestDispatcher("toimgs").forward(request, response);



        return uploadBean;
    }
}
