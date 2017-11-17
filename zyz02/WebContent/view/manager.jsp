<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>成都理工大学志愿者管理</title>
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
    <style>
        body{margin:0;padding:0;overflow-x:hidden;background: white;}
        html, body{height:100%;}
        img{border:none;}
        dl,dt,dd{display:block;margin:0;}
        a{text-decoration:none;}
        #inner{width:120px;height:auto !important;overflow:visible !important;position:fixed;height:100% !important;background-color:red;}
        #inner dt{padding-top: 70px;height: 100px;padding-left:30px;padding-right:10px;font-size:18px;position:relative;line-height:48px;cursor:pointer;}
        #inner dl img{padding-left:18px;}
        #inner dl.current{color: #000;background: white;}
        #content{width: calc(100% - 120px);border-top-width: 0;position: fixed;left: 120px;height: 100%;}
        #content ul{line-height: 25px;display: none;margin: 0 30px;padding: 10px 0;position: absolute;top: 50px;left: 50px;}
        #content ul:nth-child(1){display: block;}
        table{border-color: #cccccc;width:900px}
        caption{margin: 10px;font-weight: 600}
        th{background-color: red}
        td{text-align: center;}
        form{margin-left: 50px;font: 20px/2 tomoha}
        p{margin-left: 430px}
        input,select{height: 25px}
        textarea{resize: none}
    </style>
<script src="/zyz/js&css/min.js" type="text/javascript"></script> 
</head>
<body>

<nav class="top">
    <a href="/zyz/view/main.jsp"><span></span>主页</a>
    <span>你好，管理员</span>
    <c:if test="${root!=null}">
            <span><a href="#"><c:out value="${root.admin_name}"></c:out></a> 
            <a href="/zyz/logout">注销</a>
        </span>
        </c:if>
        
        <c:if test="${root==null}">
            <span> <a href="/zyz/view/login.jsp">登陆</a> 
        </c:if>
</nav>

<!--
没用的 
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
        <li><a href="/zyz/view/list.jsp?type='公益广告'">公益广告</a>
            <ul class="second-nav">
                <li><a href="/zyz/view/list.jsp?type='公益广告'">我们的价值观</a></li>
                <li><a href="/zyz/view/list.jsp?type='公益广告'">讲文明，树新风</a></li>
            </ul>
        </li>
    </ul>
</div>

 -->

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
<div>
    <div id="inner">
        <dl>
            <img src="/zyz/img/icon.png" width="80" alt="成都理工大学">
        </dl>
        <dl id="first" class="current">
            <dt>成员管理</dt>
        </dl>
        <dl>
            <dt>资料管理</dt>
        </dl>
        <dl>
            <dt>新闻管理</dt>
        </dl>
    </div>
    <div id="content">
        <ul>
            <div>
                <table border="1" width="600px" cellspacing="0px">
                    <caption>管理员列表</caption>
                    <tr>
                        <th>id</th>
                        <th>姓名</th>
                        <th>密码</th>
                        <th>操作</th>
                    </tr>
                    
                    	<c:forEach var="root" items="${rootlist}">
                    		<tr>
                    		<td><c:out value="${root.admin_id}"></c:out></td>
                    		<td><c:out value="${root.admin_name}"></c:out></td>
                    		<td><c:out value="${root.admin_pwd}"></c:out></td>
                    		<td><button onclick="window.location.href='/zyz/deleteAdmin?id=${root.admin_id}'">删除</button></td>
                    		</tr>
                    	</c:forEach>
                        
                        <form method='post' action="/zyz/addAdmin">
                        	<tr id = 'addmanager' style="display:none">
                        		<td></td>
                        		<td><input type = "text" name="name"></td>
                        		<td><input type = "text" name="pwd"></td>
                        		<td><input type = "submit" value="添加"> </td>
                        	</tr>
                       	</form>
                    
                </table>
                <br/>
                <button style="margin-left: 45%" onclick="addmanager()">添加新管理员</button>
            </div>
        </ul>
        <ul>
            <div>
                <table width="600px" border="1" cellspacing="0px">
                    <caption>资料列表</caption>
                    <tr>
                        <th>编号</th>
                        <th>文件名</th>
                        <th>上传时间</th>
                        <th>操作</th>
                    </tr>
                    
                    	<c:forEach var="file" items="${filelist }">
                    	<tr>
                    		<td><c:out value="${file.file_id}"></c:out></td>
                    		<td><c:out value="${file.file_name}"></c:out></td>
                    		<td><c:out value="${file.file_date}"></c:out></td>
                    		<td>
                    		<input type="button" value="下载"  onclick="window.location.href='/zyz/down?id=${file.file_id}'">
                            <input type="button" value="删除" onclick="window.location.href='/zyz/delete?id=${file.file_id}'">
                        	</td>
                        </tr>
                    	</c:forEach>    
                </table>
                <br>
                <form action="/zyz/upload" method="post" enctype="multipart/form-data">
                	<input type = "file" name = "file" >
                	<input type = "submit" value="上传">
                </form>
            </div>
        </ul>
        <!-- 自己加的	新闻管理 -->
        <ul>
            <div>
                <table border="1" width="600px" cellspacing="0px">
                    <caption>新闻列表</caption>
                    <tr>
                        <th>id</th>
                        <th>标题</th>
                        <th>内容</th>
                        <th>日期</th>
                        <th>操作</th>
                    </tr>
                    
                    	<c:forEach var="news" items="${newslist}">
                    		<tr>
                    		<td><c:out value="${news.news_id}"></c:out></td>
                    		<td><c:out value="${news.news_title}"></c:out></td>
                    		<td><c:out value="${news.news_content }"></c:out></td>
                    		<td><c:out value="${news.news_date}"></c:out></td>
                    		<td><button onclick="window.location.href='/zyz/deleteNews?id=${news.news_id}'">删除</button></td>
                    		</tr>
                    	</c:forEach>
                        
                        	<form method='post' action="/zyz/addNews">
                        	<tr id = 'addnews' style="display:none">
                        		<td></td>
                        		<td><input type = "text" name="title"></td>
                        		<td><input type = "text" name="content"></td>
                        		<td>日期由系统自动生成</td>
                        		<td><input type = "submit" value="添加"> </td>
                        	</tr>
                        	</form>
                        	
                </table>
                <br>
                <button style="margin-left: 45%" onclick="addnews()">添加新闻</button>
            </div>
        </ul>
    </div>
</div>
<script>
    window.onload= function () {
        var oDl=document.getElementById("inner").getElementsByTagName("dl");
        var uls = document.getElementById("content").getElementsByTagName("ul");
        console.log(uls);
        for (var i=1;i<oDl.length;i++){
            oDl[i].index=i;
            oDl[i].onclick=function() {
                for (var n = 0; n < oDl.length; n++) {
                    oDl[n].className = "";
                    for (var x = 0; x < uls.length; x++) {
                        uls[x].style.display = "none";
                    }
                }
                this.className = "current";
                uls[this.index - 1].style.display = "block";
            }
        }
    };
</script>

<!-- 这是	添加方法 -->
<script>
    function addmanager() {
        var oAdd=document.getElementById("addmanager");
        oAdd.style.display="table-row";
    }
    function addnews() {
        var oAdd=document.getElementById("addnews");
        oAdd.style.display="table-row";
    }
</script>

</body>
</html>
