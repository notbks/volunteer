<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE web-app PUBLIC "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN" "http://java.sun.com/dtd/web-app_2_3.dtd">
<html>
<head>

    <meta charset="UTF-8" http-equiv="content-type" content="text/html">
    <style>
        body{font-size: 12px;font-family: Arial;margin: 0px;padding: 0px}
        a{color: #999;text-decoration: none;}
        nav.top{background-color: #f2f2f2;padding-top: 5px;padding-bottom: 5px;border-bottom: 1px solid #e7e7e7;}
        nav.top span,nav.top a{color: #999;margin: 0px 10px 0px 10px;}
        nav.top a:hover{color: #c40000;text-decoration: none;}
        a:hover{color: #c40000;}
        ul{list-style: none;}
        .head{height: 50px;background:red;}
        .head .nav{width: 80%;height: 30px;line-height: 50px;margin: 0 auto;position: relative;z-index: 111;}
        .head .nav li{float: left;width: 15%;height: 30px;line-height: 50px;text-align: center;font-size: 15px}
        .head .nav li a{color: white;}
        .head .nav li .second-nav{width: 150px;display: none;position: relative;}
        .head .nav li .second-nav li{position: relative;width: 100%;height: 40px;line-height: 40px;background: red;border-top: 1px solid red;}
    </style>
</head>
<body>
<nav class="top">
    <a href="/zyz/view/main.jsp"><span></span>主页</a>
    <span>你好，志愿者！</span>
    <c:if test="${volunteer!=null}">
            <span> <a href="#"><c:out value="${volunteer.volunteer_name}"></c:out></a> 
            <a href="/zyz/logout">注销</a>
        </span>
        </c:if>
        <c:if test="${volunteer==null}">
            <span> <a href="/zyz/view/login.jsp">登陆</a> 
            <a href="/zyz/view/register.jsp">注册</a>
        </c:if>
</nav>
<div class="head">
    <ul class="nav">
        <li><a href="/zyz/view/list.jsp?type='文明成都'">文明成都</a>
            <ul class="second-nav">
                <li><a href="/zyz/view/list.jsp?type='文明成都'">新闻资讯</a></li>
            </ul>
        </li>
        <li><a href="/zyz/view/list.jsp?type='成都志愿者app'">成都志愿者app</a>
            <ul class="second-nav">
                <li><a href="/zyz/view/list.jsp?type='成都志愿者app'">项目介绍</a></li>
                <li><a href="/zyz/view/list.jsp?type='成都志愿者app'">新闻专栏</a></li>
                <li><a href="/zyz/view/list.jsp?type='成都志愿者app'">志愿者招募</a></li>
                <li><a href="/zyz/view/list.jsp?type='成都志愿者app'">活动地图</a></li>
            </ul>
        </li>
        <li><a href="/zyz/view/list.jsp?type='成都志愿者'">成都志愿者网</a>
            <ul class="second-nav">
                <li><a href="/zyz/view/list.jsp?type='成都志愿者'">新闻专栏</a></li>
                <li><a href="/zyz/view/list.jsp?type='成都志愿者'">宣传视频</a></li>
                <li><a href="/zyz/view/list.jsp?type='成都志愿者'">专题活动</a></li>
            </ul>
        </li>
        <li><a href="/zyz/view/list.jsp?type='雷锋热线'">雷锋热线</a>
            <ul class="second-nav">
                <li><a href="/zyz/view/list.jsp?type='雷锋热线'">项目介绍</a></li>
                <li><a href="/zyz/view/list.jsp?type='雷锋热线'">新闻专栏</a></li>
                <li><a href="/zyz/view/list.jsp?type='雷锋热线'">我要求助</a></li>
                <li><a href="/zyz/view/list.jsp?type='雷锋热线'">我要帮扶</a></li>
                <li><a href="/zyz/view/list.jsp?type='雷锋热线'">品牌活动</a></li>
                <li><a href="/zyz/view/list.jsp?type='雷锋热线'">宣传视频</a></li>
            </ul>
        </li>
        <li><a href="/zyz/view/list.jsp?type='公益活动'">公益活动</a>
            <ul class="second-nav">
                <li><a href="/zyz/view/list.jsp?type='公益活动'">让轮椅飞</a></li>
                <li><a href="/zyz/view/list.jsp?type='公益活动'">名师一堂课</a></li>
                <li><a href="/zyz/view/list.jsp?type='公益活动'">睡前讲故事</a></li>
            </ul>
        </li>
        <li><a href="/zyz/view/list.jsp?type='资料下载'">资料下载</a>
        </li>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        var _this1=null;
        $('.nav>li').hover(function(){
            _this1=$(this);
            _this1.find('.second-nav').show();
            var _this2=null;
            _this1.find('.second-nav').find('li').hover(function(){
                _this2=$(this);
            },function(){
                _this2.find('.third-nav').hide();
            });
        },function(){
            _this1.find('.second-nav').hide();
        });
    });
</script>

</body>
</html>