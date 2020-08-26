package com.doposts.dao.monitor;

import com.doposts.dao.DatabaseConfig;
import com.doposts.dao.PostItDatabase;
import com.doposts.entity.User;
import com.dxhualuo.database.interfaces.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 *  数据库监控Servlet
 * @author dx_hualuo
 */
public class DatabaseMonitorServlet extends HttpServlet {
    @Override
    public void init() {
        System.out.println("\n" +
                "           ____  _  _        ____   __  ____  __   ____   __   ____  ____ \n" +
                "          (    \\( \\/ )      (    \\ / _\\(_  _)/ _\\ (  _ \\ / _\\ / ___)(  __)\n" +
                "           ) D ( )  (  ____  ) D (/    \\ )( /    \\ ) _ (/    \\\\___ \\ ) _) \n" +
                "          (____/(_/\\_)(____)(____/\\_/\\_/(__)\\_/\\_/(____/\\_/\\_/(____/(____)\n");
        System.out.println("Dx_Database 》 载入配置文件............");
        System.out.println("Dx_Database =》 数据库域名或IP："+ DatabaseConfig.getUrl());
        System.out.println("Dx_Database =》 端口："+ DatabaseConfig.getPort());
        System.out.println("Dx_Database =》 数据库名："+ DatabaseConfig.getDatabase());
        System.out.println("Dx_Database =》 登录名："+ DatabaseConfig.getUserName());
        System.out.println("Dx_Database =》 密码：[****已隐藏****]");
        System.out.println("DX_Database ==》 数据库初始化开始 =》 时间："+ new Date().toString());
        long time = System.currentTimeMillis();
        System.out.println("DX_Database ===》 初始化C3P0 =》 ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ");
        PostItDatabase.testConnection();
        System.out.println("DX_Database ====》 初始化数据库表：CreateClassRequest");
        PostItDatabase.CREATE_CLASS_REQUEST_DAO.getUnauthorizedClassCount();
        System.out.println("DX_Database ====》 初始化数据库表：PostClass");
        PostItDatabase.POST_CLASS_DAO.getPostClasschildrenCountById(0);
        System.out.println("DX_Database ====》 初始化数据库表：User");
        PostItDatabase.USER_DAO.selectUserCount();
        System.out.println("DX_Database ====》 初始化数据库表：Post");
        PostItDatabase.POST_DAO.getPostPageByClassId(0,0,0);
        System.out.println("DX_Database ====》 初始化数据库表：Floor");
        PostItDatabase.FLOOR_DAO.getFloorByPostId(0);
        System.out.println("DX_Database ====》 初始化数据库表：Reply");
        PostItDatabase.REPLY_DAO.getReplyListById(0);
        System.out.println("DX_Database =====》 初始化完成！ 耗时："+ (System.currentTimeMillis() - time)+ "ms");
        System.out.println("DX_Database ======》 监控启动在URL：web/DX_DatabaseMonitor");
        boolean dataOut = Boolean.parseBoolean(DatabaseConfig.getDataOutPut());
        boolean output = Boolean.parseBoolean(DatabaseConfig.getConsoleOutput());
        DatabaseMonitor.init(dataOut, output);
        System.out.println("DX_Database =======》 控制台日志输出："+ output);
        System.out.println("DX_Database =======》 查询结果输出："+ dataOut);
        System.out.println("DX_Database =======》 监控已启动！");
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object userObj = request.getSession().getAttribute("user");
        if (userObj != null) {
            User user = (User)userObj;
            if ("admin".equals(user.getGroup()) && user.getStatus() == 1) {
                request.getRequestDispatcher("/WEB-INF/views/database/admin.jsp");
            }else{
                request.getRequestDispatcher("/WEB-INF/views/database/groupError.jsp");
            }
        } else {
            request.getRequestDispatcher("/WEB-INF/views/database/DX_DatabaseMonitor.jsp").forward(request, response);
        }
    }
}
