<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>统一登录</title>
</head>
<body>
<h1>统一登录入口</h1>
<form action="loginServlet">
    <c:if test="${requestScope.error != null}">
        <strong style="color: red">${error}</strong>
    </c:if>

    <br/>
    用户名:<input type="text" name="user" placeholder="请输入用户名" />
    <br/>
    密 码:<input type="password" name="password" placeholder="请输入密码"/>
    <br/>
    <input type="submit"/>
</form>
<a href="register.jsp">学员注册</a>

</body>
</html>
