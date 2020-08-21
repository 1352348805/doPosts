<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/8/18
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
String path=request.getContextPath();
%>
<style>
    .top{

        border-left: 1px solid #E5E5E5;
        border-top: 1px solid #E5E5E5;
        border-right: 1px solid #E5E5E5;
        margin-right: -2px;
        margin: 0 auto;
        height: 82px;
        width: 900px;
        background-color:rgb(244,246,249);
    }
    a{
        text-decoration: none;
    }
    body {margin: 0; padding: 0}
    *{padding:0; margin:0}

    body,div,ol,ul,li,dl,dt,dd,h1,h2,h3,h4,h5,h6,p,form,fieldset,legend,input{ margin:0; padding:0;}
    h1,h2,h3,h4,h5,h6{ font-size:100%; font-weight:normal;}
    ol,ul{ list-style:none;}
    img,fieldset{ border:0 none; display:block;}
</style>
<head>
    <title>Title</title>
</head>
<body>

<div class="content clearfix ">
<div class="top">
    <div style=" padding: 17px 0px 0px 100px; width: 52px; height: 52px;  display: inline-block;"   >
         <div  style="display: inline-block; margin: 15px 30px 15px 30px">
             <a href="#" STYLE=" text-decoration: none;">
                 <img  width="48px" height="48px" src="img/123.jpg">
             </a>
         </div>
        
        <div style="height: 341px; width:40px; display: inline-block; ">
            <a href="#">傻逼吧</a>
        </div>
    </div>

    <div style="float: right;width: 200px;height: 50px;margin: 15px 20px 0px 0px; display: inline-block;">
            <div style="font-size: 18px;display: inline;background-color: deepskyblue;width: 100px;">
                <a href="#" title="签到" style="width: 100px;color: #FBFBFB;text-align: center;line-height: 50px;  height: 50px;display: block;background-color: deepskyblue;float: left">
                 签到
                </a>
            </div>
            <div style="height: 50px;width: 100px;font-size: 12px;float: left;background-color: white">
                <a href="#" style="width: 100px;text-align: center;line-height: 50px;  height: 50px;display: block;float: left">
                    8月19日&nbsp;&nbsp;&nbsp;漏签0天
                </a>
            </div>
    </div>
</div>
<div style="">

</div>
    <div>

    </div>
</div>

</body>
</html>
