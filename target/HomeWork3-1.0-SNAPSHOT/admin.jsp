<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<meta charset="utf-8" />
<head>
    <title>课程管理</title>
    <link type="text/css" rel="stylesheet" href="common.css">
</head>
<body>

<h4>欢迎您,管理员</h4>
<h1>课程列表:</h1>
<c:if test="${requestScope.msg!=null}">
    <p style="color: deepskyblue">${requestScope.msg}</p>
</c:if>
<table border="1">
    <tr>
        <th>编号</th>
        <th>名称</th>
        <th>讲师</th>
        <th>开课时间</th>
        <th>学分</th>
        <th>课时</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${courses}" var="course">
        <tr>
            <form action="updateCourse" method="post" id="${course.id}">
                <td>
                    <input disabled="disabled" value="${course.id}"/>
                    <input hidden="hidden" name="id" value="${course.id}"/>
                </td>
                <td>
                    <input class="sinput" name="name" value="${course.name}"/>
                </td>

                <td>
                    <input class="sinput" name="teachName" value="${course.teachName}"/>
                </td>

                <td>
                    <input class="sinput" name="startTime" type="date" value="${course.startTimeText}"/>
                </td>

                <td>
                    <input class="sinput" name="score" type="number" value="${course.score}"/>
                </td>

                <td>
                    <input class="sinput" name="hours" type="number" value="${course.hours}"/>
                </td>

                <td>
                    <button type="button" hidden="hidden" onclick="confirmUpdate(${course.id})">保存</button>
                    <button type="button" onclick="confirmDelete(${course.id})">删除</button>
                </td>
            </form>
        </tr>
    </c:forEach>
</table>
<h2>添加课程:</h2>

<form id="add" action="addCourse" method="post">
    名称:<input name="name"/>
    讲师:<input name="teachName"/>
    开课时间:<input name="startTime" type="date"/>
    学分:<input name="score" type="number"/>
    课时:<input name="hours" type="number"/>
    <input id="submitbtn" type="button" onclick="addCourse()" value="确认提交"/>
</form>

<script>

    function confirmUpdate(id) {
        if (confirm("确认修改吗?")) {
            document.getElementById(id).submit();
        }
    }
    function confirmDelete(id) {
        if (confirm("确认删除吗?")) {
            window.location.href = "deleteCourse?id="+id;
        }
    }

    let inputs = document.getElementsByClassName("sinput");
    for (let i = 0; i < inputs.length; i++) {
        input = inputs[i];
        input.onchange = function () {
            let btn = this.parentElement.parentElement.getElementsByTagName("button")[0];
            console.log(btn)
            btn.hidden = false;
        }
    }
    function addCourse(){
        if(confirm("确认提交吗?")){
            document.getElementById("add").submit();
        }
    }
</script>
</body>
</html>
