<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="left">
    <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
    <nav>
        <ul class="list">
            <li><a href="<%=path%>/admin?action=categoryList">分类管理</a></li>
            <li ><a href="<%=path%>/admin?action=postList">帖子管理</a></li>
            <li><a href="<%=path%>/admin?action=tUser">用户管理</a></li>
            <li><a href="<%=path%>/admin?action=toModifyPwd">密码修改</a></li>
            <li><a href="<%=path%>/admin?action=exit">退出系统</a></li>
        </ul>
    </nav>
</div>
