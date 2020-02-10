<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
</head>
<body>
<h1>学员注册</h1>
<form action="registerStudent" id="fm">

    <br/>
    用户名:<input type="text" id="name" name="user" placeholder="请输入用户名" />
    <br/>
    密 码:<input type="password" id="pwd1" name="password" placeholder="请输入密码"/>
    <br/>
    确认密码:<input type="password" id="pwd2" name="password2" placeholder="再次输入密码" />
    <br/>
    <input type="button" onclick="sub()" value="提交"/>
</form>
<span style="color: red">${error}</span>
<script>
    function sub(){
        username = document.getElementById("name").value;
        input1 = document.getElementById("pwd1").value;
        input2 = document.getElementById("pwd2").value;
        if (username == "" || input1 == ""){
            document.getElementsByTagName("span")[0].innerText = "用户名和密码不能为空"
        }
        else if (input1 != input2){
            document.getElementsByTagName("span")[0].innerText = "两次密码不一致"
        }else{
            document.getElementById("fm").submit();
        }
    }
</script>
</body>
</html>