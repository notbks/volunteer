<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>成都理工大学志愿者网主页</title>
    <link rel="stylesheet" type="text/css" href="/zyz/js&css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="/zyz/js&css/demo.css">
    <link rel="stylesheet" type="text/css" href="/zyz/js&css/jquery-yys-slider.css">
    <script src="/zyz/js&css/min.js" type="text/javascript"></script> 
    <script src="/zyz/js&css/slider.js" type="text/javascript"></script>
    <style>
        #right{float: left;width: 10%;height:15%;margin-top: 7%;margin-left: 50px;background-color: #f2f2f2}
        #right a{font: 15px/1.5 Tahoma}
    </style>
</head> 

<body>
<jsp:include page="head.jsp"></jsp:include>

<div id="right">
    <div style="background-color: red"><h4 style="text-align: center;color: white;margin: 0px;font: 15px/1.5 Tahoma">公告栏</h4>
        <hr></div>
        <c:forEach var="form" items="${list}">
        	<a href="/zyz/view/news.jsp?id=${form.news_id}&type='公告' " ><c:out value="${form.news_title} ;"/></a><br/>  
        	<a href="#">守护童心 充盈小朋友的暑期生活;</a><br/>
        	<a href="#">一级演员当文艺志愿者 为敬老院老人送夏季特演;</a><br/>
        	<a href="#">市文明办等部门领导慰问高温天坚守岗位的志愿者;</a><br/>
        </c:forEach> 
   <form id = " form" action="/news">
   	<input type = "text" id = "news_id" value="" name="news_id" hidden="true">
   </form>
</div>
<div class="content-part part-tese">
    <div class="content-title"></div>
    <div class="shadow"></div>
    <div class="gallery_container">
        <div class="gallery_wrap threeD_gallery_wrap" style="margin-left: -360px; margin-top: -380px;">
            <div href="javascript:;" class="gallery_item threeD_gallery_item gallery_left_middle">
                <img src="/zyz/pic/1.jpg" class="show">
                <div class="line-t"></div>
                <div class="line-r"></div>
                <div class="line-b"></div>
                <div class="line-l"></div>
            </div>
            <div href="javascript:;" class="gallery_item threeD_gallery_item front_side">
                <img src="/zyz/pic/2.jpg" class="show">
                <div class="line-t"></div>
                <div class="line-r"></div>
                <div class="line-b"></div>
                <div class="line-l"></div>
            </div>
            <div href="javascript:;" class="gallery_item threeD_gallery_item gallery_right_middle">
                <img src="/zyz/pic/3.jpg" class="show">
                <div class="line-t"></div>
                <div class="line-r"></div>
                <div class="line-b"></div>
                <div class="line-l"></div>
            </div>
            <div href="javascript:;" class="gallery_item threeD_gallery_item gallery_out">
                <img src="/zyz/pic/4.jpg" class="show">
                <div class="line-t"></div>
                <div class="line-r"></div>
                <div class="line-b"></div>
                <div class="line-l"></div>
            </div>
        </div>
        <a class="prev" href="javascript:;"></a>
        <a class="next" href="javascript:;"></a>
    </div>
</div> 


    <hr style="height: 5px;background-color: red;border: none;margin-top:42%">
    <br/>
    <div align="center" >
    	<p>
Copyright © 2012 - 2016 cdvolunteer.com . All Rights Reserved. 蜀ICP备12017097号-1<br>
成都市精神文明建设办公室 版权所有<br>
运营单位：成都晚报社 技术支持：四川升途信息科技有限公司     <br>
   当前在线2333人</p>
    </div>
<script type="text/javascript">
    $(function(){
        $('.content-part.part-tese').addClass('show');
        $('.gallery_container').gallery_slider({imgNum: 4});
    })
</script>

</html>