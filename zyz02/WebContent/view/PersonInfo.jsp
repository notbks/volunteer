<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>完善信息</title>
    <style>
        #outer{width: 79%;height: 600px;background-color: white;margin: 10px 180px 100px 180px}
        #inner{text-align: center;margin-top: 50px;margin-right: 200px;}
        #inner div{text-align: left;margin-left: 41%}
        #user,#age{background:rgba(0,0,0,.1) no-repeat;width: 200px;height: 30px;border:solid #ccc 1px;border-radius: 3px;padding-left: 3px;margin-bottom: 20px;}
        #exp{background:rgba(0,0,0,.1) no-repeat;border:solid #ccc 1px;border-radius: 3px;margin-bottom: 20px;}
        #finish{width: 100px;height: 30px;background: rgba(0,0,0,.1);border:solid #ccc 1px;border-radius: 3px;margin-right: 32px}
        #reset{width: 100px;height: 30px;background: rgba(0,0,0,.1);border:solid #ccc 1px;border-radius: 3px;}
        #finish:hover{cursor: pointer;background:#D8D8D8;}
        hr{height: 5px;background-color: red;border: none}
        h1{float: inherit;margin-left: 20px;color: red;font: 30px/1.5 Arial}
    </style>
      <script src="/zyz/js&css/min.js" type="text/javascript"></script> 
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div style="text-align: right;margin-right: 220px"><img src="image/name.png" width="300px"></div>
<div id="outer">
    <h1>完善个人资料</h1>
    <hr>
    <div id="inner">
        <form action="personInfo" method="post">
            <div><p>姓名：<input type="text" name="name" id="user" readonly="true" placeholder="${volunteer.volunteer_name}"></p></div>
            <div>
                <p>性别：
                    <label><input name="sex" type="radio" value="male"/>男</label>
                    <label><input name="sex" type="radio" value="female"/>女</label>
                </p>
            </div>
            <div><p>年龄：<input type="text" name="age" id="age" placeholder="请输入您的年龄"></p></div>
            <div>
                <p>个人履历:<br><textarea name="record" id="exp" cols="60" rows="5" placeholder="请介绍自己作为志愿者的一些履历" style="background-color: #D8D8D8"></textarea></p>
            </div>
            <p><input type="submit" name="finish" id="finish" value="完成"><input type="reset" id="reset" value="重置"></p>
        </form>
    </div>
    <hr style="margin-top: 150px">
</div>
</body>
</html>