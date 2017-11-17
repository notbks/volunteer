<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    
    <title>志愿者登录系统</title>
    <style>
        body{background-image:'view/red.jpg';}
        #outer{width: 79%;height: 600px;background-color: white;margin: 10px 180px 100px 180px}
        #inner_right{text-align: right;margin-top: 50px;margin-right: 200px;float: right}
        #inner_left{text-align: left;margin-top: 10px;margin-left: 100px;float: left}
        #name{background:rgba(0,0,0,.1) no-repeat;width: 200px;height: 30px;border:solid #ccc 1px;border-radius: 3px;padding-left: 32px;margin-top: 20px;margin-bottom: 30px;}
        #pwd{background:rgba(0,0,0,.1) no-repeat;width: 200px;height: 30px;border:solid #ccc 1px;border-radius: 3px;padding-left: 32px;margin-bottom: 20px;}
        #check{font: 12px/1.5 Tahoma;text-align: center}
        #submit{width: 100px;height: 30px;background: rgba(0,0,0,.1);border:solid #ccc 1px;border-radius: 3px;margin-right: 32px}
        #register{width: 100px;height: 30px;background: rgba(0,0,0,.1);border:solid #ccc 1px;border-radius: 3px;}
        #submit:hover{cursor: pointer;background:#D8D8D8;}
        hr{height: 5px;background-color: red;border: none}
        h1{float: inherit;margin-left: 20px;color: red;font: 30px/1.5 Arial}
    </style>
</head>
<body>
    <div style="text-align: right;margin-right: 220px"><img src="/zyz/img/name.png" width="300px"></div>
<div id="outer">
    <h1>志愿者登陆</h1> 
    <hr>
    <div id="inner_left">
        <img src="/zyz/img/hand.jpg"  width="70%">
    </div>
    <div id="inner_right">
        <form action="/zyz/login" method="post">
            <p><input type="text" name="name" id="name" placeholder="用户名"></p>
            <p><input type="password" name="pwd" id="pwd" placeholder="密码"></p>
            <%if(request.getAttribute("erro")!=null) out.print("<p><font size=2 color=red>"+request.getAttribute("erro")+"</font><p>"); %>
            <input type="submit" name="submit" id="submit" value="登录" onclick="logincheck()">
            
            <p><input type="checkbox" name="checkbox" value="true">是否以管理员身份登录<p>
            
            <p><a href="/zyz/view/register.jsp">快速注册</a></p> 
        </form>
    </div>
    <hr style="margin-top: 450px">
</div>
    <script language="JavaScript" type="text/javascript">
        function logincheck() {
            var id=document.getElementById("user");
            var pwd=document.getElementById("pwd");
            if (id.value==""||pwd.value==""){
                alert("账号或密码不能为空！");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>