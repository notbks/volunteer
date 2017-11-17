<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hck.struts.form.*"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp"></jsp:include>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	ArrayList<NewsForm> list = (ArrayList<NewsForm>)request.getSession().getAttribute("list");
	for(NewsForm form : list){
		System.out.print(form.getNews_title());
		if (form.getNews_id() == id){
			
%>
		<head>
<meta charset="UTF-8">
<title><%out.print(form.getNews_title());%></title>

<style>
a {
	text-decoration: none
}
</style>
<script src="/zyz/js&css/min.js" type="text/javascript"></script> 
		</head>
		<body>
			<div style="width: 70%; margin-left: 12%">
				<div id="now">
					<p>
						当前位置：<a href="/zyz/view/main.jsp">首页</a>><a href="/zyz/view/list.jsp?type='<%out.print(request.getParameter("type"));%>'"><%out.print(request.getParameter("type")); %></a>>
						<%out.print(form.getNews_title());%>
					</p>
				</div>
				<h1 style="text-align: center">
					<%out.print(form.getNews_title());%>
				</h1>
				<br>
				<p style="text-align: right">
					<%out.print(form.getNews_date());%>
				</p>
				<hr>
				<div id="content">
					<%out.print(form.getNews_content());%>
				</div>
				<p style="text-align: right">
					<a href="#"><a>返回主页</a>
				</p>
			</div>

		</body>
</html>

<%
		}
	}
%>