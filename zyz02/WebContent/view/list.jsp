<%@page import="java.util.ArrayList"%>
<%@page import="com.hck.struts.form.*"%>
<%@page import="com.hck.dao.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <title>新闻列表</title>
    <style type="text/css">
        *{margin:0;padding:0;list-style-type:none;}
        a,img{border:0;}
        a,a:visited{color:#5e5e5e; text-decoration:none;}
        a:hover{color:#b52725;text-decoration:underline;}
        .clear{display:block;overflow:hidden;clear:both;height:0;line-height:0;font-size:0;}
        body{font:12px/180% Arial, Helvetica, sans-serif;}
        .demo{width:70%;margin:20px auto;border:solid 1px #ddd;padding:0 10px;}
        .demo h2{font-size:14px;color: red;;height:30px;line-height:30px;padding:15px 0;color:red;}
        .ranklist{height:200px;overflow:hidden;}
        .ranklist li{height:16px;line-height:16px;overflow:hidden;position:relative;padding:0 70px 0 30px;margin:0 0 10px 0;}
        .ranklist li em{width:20px;height:16px;overflow:hidden;display:block;position:absolute;left:0;top:0;text-align:center;font-style:normal;color:#333;}
        .ranklist li em{background-position:0 -16px;}
        .ranklist li.top em{background-position:0 0;color:#fff;}
        .ranklist li .num{position:absolute;right:0;top:0;color:#999;}
    </style>
    <script src="/zyz/js&css/min.js" type="text/javascript"></script> 
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="demo">

<%
	String type = request.getParameter("type");
	System.out.print(type);

	if(type.equals("'文明成都'")) {
%>

    <h2>文明成都</h2>
    <div class="ranklist">
        <ul>
        	
        	<c:forEach var="news" varStatus="i" items="${list}">
        		<li>
                <em> ${i.index+1} </em><p><a href="/zyz/view/news.jsp?id=${news.news_id}&type=文明成都" target="_blank">${news.news_title}</a></p><span class="num">${news.news_date } </span>
            </li>
        	</c:forEach>
            <li>
                <em>3</em><p><a href="#" target="_blank">北京地铁站内老人心脏骤停 留学生联手市民施救</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>4</em><p><a href="#" target="_blank">武警上海总队退伍老兵的最后一次为民志愿服务</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>5</em><p><a href="#" target="_blank">长寿街道公益项目受欢迎社会组织为何在此井喷增长？</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>6</em><p><a href="#" target="_blank">守护童心 充盈小朋友的暑期生活</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>7</em><p><a href="#" target="_blank">庆祝上海市志愿者协会成立20周年系列活动拉开序幕</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>8</em><p><a href="#" target="_blank">市文明办等部门领导慰问高温天坚守岗位的志愿者</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>9</em><p><a href="#" target="_blank"> 一级演员当文艺志愿者 为敬老院老人送夏季特演</a></p><span class="num">2017-09-15</span>
            </li>
            
        </ul>
    </div>

  <% 
	} 	
  
	if(type.equals("'成都志愿者app'")) {
 %>
    <h2>成都志愿者app</h2>
    <div class="ranklist">
        <ul>
            <c:forEach var="news" varStatus="i" items="${list}">
        		<li>
                <em> ${i.index+1} </em><p><a href="/zyz/view/news.jsp?id=${news.news_id}&type=成都志愿者app" target="_blank">${news.news_title}</a></p><span class="num">${news.news_date } </span>
            </li>
        	</c:forEach>
            <li>
                <em>3</em><p><a href="#" target="_blank">北京地铁站内老人心脏骤停 留学生联手市民施救</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>4</em><p><a href="#" target="_blank">武警上海总队退伍老兵的最后一次为民志愿服务</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>5</em><p><a href="#" target="_blank">长寿街道公益项目受欢迎社会组织为何在此井喷增长？</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>6</em><p><a href="#" target="_blank">守护童心 充盈小朋友的暑期生活</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>7</em><p><a href="#" target="_blank">庆祝上海市志愿者协会成立20周年系列活动拉开序幕</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>8</em><p><a href="#" target="_blank">市文明办等部门领导慰问高温天坚守岗位的志愿者</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>9</em><p><a href="#" target="_blank"> 一级演员当文艺志愿者 为敬老院老人送夏季特演</a></p><span class="num">2017-09-15</span>
            </li>
        </ul>
    </div>
 <% 
	}	
  
	if(type.equals("'成都志愿者'")) {
%>

    <h2>成都志愿者网</h2>
    <div class="ranklist">
        <ul>
           <c:forEach var="news" varStatus="i" items="${list}">
        		<li>
                <em> ${i.index+1} </em><p><a href="/zyz/view/news.jsp?id=${news.news_id}&type=成都志愿者网" target="_blank">${news.news_title}</a></p><span class="num">${news.news_date } </span>
            </li>
        	</c:forEach>
            <li>
                <em>3</em><p><a href="#" target="_blank">北京地铁站内老人心脏骤停 留学生联手市民施救</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>4</em><p><a href="#" target="_blank">武警上海总队退伍老兵的最后一次为民志愿服务</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>5</em><p><a href="#" target="_blank">长寿街道公益项目受欢迎社会组织为何在此井喷增长？</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>6</em><p><a href="#" target="_blank">守护童心 充盈小朋友的暑期生活</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>7</em><p><a href="#" target="_blank">庆祝上海市志愿者协会成立20周年系列活动拉开序幕</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>8</em><p><a href="#" target="_blank">市文明办等部门领导慰问高温天坚守岗位的志愿者</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>9</em><p><a href="#" target="_blank"> 一级演员当文艺志愿者 为敬老院老人送夏季特演</a></p><span class="num">2017-09-15</span>
            </li>
        </ul>
    </div>
 <% 
	} 	
  
	if(type.equals("'雷锋热线'")) {
%>
    <h2>雷锋热线</h2> 
    <div class="ranklist">
        <ul>
           <c:forEach var="news" varStatus="i" items="${list}">
        		<li>
                <em> ${i.index+1} </em><p><a href="/zyz/view/news.jsp?id=${news.news_id}&type=雷锋热线" target="_blank">${news.news_title}</a></p><span class="num">${news.news_date } </span>
            </li>
        	</c:forEach>
            <li>
                <em>3</em><p><a href="#" target="_blank">北京地铁站内老人心脏骤停 留学生联手市民施救</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>4</em><p><a href="#" target="_blank">武警上海总队退伍老兵的最后一次为民志愿服务</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>5</em><p><a href="#" target="_blank">长寿街道公益项目受欢迎社会组织为何在此井喷增长？</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>6</em><p><a href="#" target="_blank">守护童心 充盈小朋友的暑期生活</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>7</em><p><a href="#" target="_blank">庆祝上海市志愿者协会成立20周年系列活动拉开序幕</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>8</em><p><a href="#" target="_blank">市文明办等部门领导慰问高温天坚守岗位的志愿者</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>9</em><p><a href="#" target="_blank"> 一级演员当文艺志愿者 为敬老院老人送夏季特演</a></p><span class="num">2017-09-15</span>
            </li>
        </ul>
    </div>
 <% 
	}	
  
	if(type.equals("'公益活动'")) {
%>
    <h2>公益活动</h2>
    <div class="ranklist">
        <ul>
           <c:forEach var="news" varStatus="i" items="${list}">
        		<li>
                <em> ${i.index+1} </em><p><a href="/zyz/view/news.jsp?id=${news.news_id}&type=公益活动" target="_blank">${news.news_title}</a></p><span class="num">${news.news_date } </span>
            </li>
        	</c:forEach>
            <li>
                <em>3</em><p><a href="#" target="_blank">北京地铁站内老人心脏骤停 留学生联手市民施救</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>4</em><p><a href="#" target="_blank">武警上海总队退伍老兵的最后一次为民志愿服务</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>5</em><p><a href="#" target="_blank">长寿街道公益项目受欢迎社会组织为何在此井喷增长？</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>6</em><p><a href="#" target="_blank">守护童心 充盈小朋友的暑期生活</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>7</em><p><a href="#" target="_blank">庆祝上海市志愿者协会成立20周年系列活动拉开序幕</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>8</em><p><a href="#" target="_blank">市文明办等部门领导慰问高温天坚守岗位的志愿者</a></p><span class="num">2017-09-15</span>
            </li>
            <li>
                <em>9</em><p><a href="#" target="_blank"> 一级演员当文艺志愿者 为敬老院老人送夏季特演</a></p><span class="num">2017-09-15</span>
            </li>
        </ul>
    </div>
 <% 
	} 	
  
	if(type.equals("'资料下载'")) {
%>

	<%
		ArrayList<FileForm> list = FileDao.getFiles();
		request.setAttribute("fileList", list);
	%>
	
    <h2>资料下载</h2>
    <div class="ranklist">
        <ul>
            <c:forEach var="file" varStatus="i" items="${fileList}">
        		<li>
                <em> ${i.index+1} </em><p><a href="/zyz/down?id=${file.file_id}&type=资料下载" target="_blank">${file.file_name}</a></p><span class="num">${file.file_date} </span>
            </li>
        	</c:forEach>
            
        </ul>
    </div>
  
    <%} %>
    
</div>

<br/>
    <br/>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <hr style="height: 5px;background-color: red;border: none">
    <br/>
    <div align="center">
    	<p>
Copyright © 2012 - 2016 cdvolunteer.com . All Rights Reserved. 蜀ICP备12017097号-1<br>
成都市精神文明建设办公室 版权所有<br>
运营单位：成都晚报社 技术支持：四川升途信息科技有限公司     <br>
   当前在线2333人</p>
    </div>

<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
<script type="text/javascript">
    (function($){

        $.fn.myScroll = function(options){
            //默认配置
            var defaults = {
                speed:40,  //滚动速度,值越大速度越慢
                rowHeight:24 //每行的高度
            };

            var opts = $.extend({}, defaults, options),intId = [];

            function marquee(obj, step){

                obj.find("ul").animate({
                    marginTop: '-=1'
                },0,function(){
                    var s = Math.abs(parseInt($(this).css("margin-top")));
                    if(s >= step){
                        $(this).find("li").slice(0, 1).appendTo($(this));
                        $(this).css("margin-top", 0);
                    }
                });
            }

            this.each(function(i){
                var sh = opts["rowHeight"],speed = opts["speed"],_this = $(this);
                intId[i] = setInterval(function(){
                    if(_this.find("ul").height()<=_this.height()){
                        clearInterval(intId[i]);
                    }else{
                        marquee(_this, sh);
                    }
                }, speed);

                _this.hover(function(){
                    clearInterval(intId[i]);
                },function(){
                    intId[i] = setInterval(function(){
                        if(_this.find("ul").height()<=_this.height()){
                            clearInterval(intId[i]);
                        }else{
                            marquee(_this, sh);
                        }
                    }, speed);
                });

            });

        }

    })(jQuery);

    $(function(){

        $("div.ranklist").myScroll({
            speed:40,
            rowHeight:24
        });

    });
</script>
</body>
</html>

