<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>志愿者注册</title>
    <style>
        body{background-color: white}
        #outer{width: 80%;height: 600px;background-color: white;margin: 10px 180px 100px 180px}
        #inner_right{text-align: right;margin-top: 50px;margin-right: 200px;float: right}
        #inner_left{text-align: left;margin-top: 10px;margin-left: 100px;float: left}
        #user,#pwd,#confirm_pwd{background:rgba(0,0,0,.1) no-repeat;width: 200px;height: 30px;border:solid #ccc 1px;border-radius: 3px;padding-left: 32px;margin-bottom: 20px;}
        #register{width: 100px;height: 30px;background: rgba(0,0,0,.1);border:solid #ccc 1px;border-radius: 3px;margin-right: 32px}
        #reset{width: 100px;height: 30px;background: rgba(0,0,0,.1);border:solid #ccc 1px;border-radius: 3px;}
        #register:hover{cursor: pointer;background:#D8D8D8;}
        hr{height: 5px;background-color: red;border: none}
        h1{float: inherit;margin-left: 20px;color: red;font: 30px/1.5 Arial}
    </style>
</head>
<body>
<div style="text-align: right;margin-right: 220px"><img src="/zyz/img/name.png" width="300px"></div>
<div id="outer">
    <h1>志愿者快速注册</h1>
    <hr>
    <div id="inner_left">
        <img src="/zyz/img/hand.jpg"  width="70%">
    </div>
    <div id="inner_right">
        <form action="/zyz/register" method="post">
            <p><input type="text" name="name" id="user" placeholder="用户名"></p>
            <p><input type="password" name="pwd" id="pwd" placeholder="密码"></p>
            <p><input type="password" name="confirm_pwd" id="confirm_pwd" placeholder="重复密码"></p>
            <p><input type="submit" name="register" id="register" value="注册" onclick="return check()"><input type="reset" id="reset" value="重置"></p>
            <%if(request.getAttribute("erro") != null) out.print("<p><font color=red size=2>"+request.getAttribute("erro")+"</font></p>");%>
        </form>
    </div>
    <hr style="margin-top: 450px">
</div>
<script language="JavaScript" type="text/javascript">
    function check() {
        var user=document.getElementById("user");
        var pwd=document.getElementById("pwd");
        var pwd1=document.getElementById("confirm_pwd");
        if (user.value==""||pwd.value==""||pwd1.value==""){
            alert("有未填项！");
            return false;
        }else if (pwd.value!=pwd1.value) {
            alert("两次输入的密码不一致！");
            return false;
        }
    }
</script>
</body>
</html>
