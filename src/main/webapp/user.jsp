<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<meta charset="utf-8"/>
<title></title>
</head>
<h4>你好:${requestScope.user.username}同学</h4>
<body>
<h1>课程选择</h1>
<table border="1">
    <tr>
        <th>编号</th>
        <th>名称</th>
        <th>讲师</th>
        <th>开课时间</th>
        <th>学分</th>
        <th>课时</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${courses}" var="course">
        <form method="post" id="${course.id}">
            <tr>
                <input hidden="hidden" name="cid" value="${course.id}"/>
                <input hidden="hidden" name="uid" value="${requestScope.user.id}"/>
                <td>
                        ${course.id}
                </td>
                <td>
                        ${course.name}
                </td>
                <td>
                        ${course.teachName}
                </td>

                <td>
                        ${course.startTimeText}
                </td>

                <td>
                        ${course.score}
                </td>

                <td>
                        ${course.hours}
                </td>


                <c:if test="${requestScope.user.courseIds.contains(course.id)}">
                    <td class="hasChoice" style="color: deepskyblue">已选择</td>
                </c:if>
                <c:if test="${!requestScope.user.courseIds.contains(course.id)}">
                    <td>未选择</td>
                </c:if>


                <td>
                    <button type="button" onclick="choiceCourse('${course.name}',${course.id},${requestScope.user.courseIds.contains(course.id)})">选择</button>
                    <button type="button" onclick="cancelCourse('${course.name}',${course.id},${requestScope.user.courseIds.contains(course.id)})">取消</button>
                </td>

            </tr>
        </form>
    </c:forEach>
</table>
<p id="info"></p>
</body>
<script>

    function choiceCourse(course_name, form_id,status) {
        if(status){
            alert("您已选择该课程...")
        }
        else if (confirm("确定选择课程:'" + course_name + "'吗?")) {
            fm = document.getElementById(form_id);
            fm.action = "choiceCourse"
            fm.submit();
        }
    }

    function cancelCourse(course_name, form_id,status) {
        if(!status){
            alert("您还未选择该课程...")
        }else if (confirm("确定取消课程:'" + course_name + "'吗?")) {
            fm = document.getElementById(form_id);
            fm.action = "cancelCourse"
            fm.submit();
        }
    }
//    统计学分
    choicess = document.getElementsByClassName("hasChoice")
    sum = 0;
    for (let i = 0; i < choicess.length; i++) {
        score = parseInt(choicess[i].previousElementSibling.previousElementSibling.innerText)
        if (score){
            sum += score
        }
    }
    document.getElementById("info").innerText = "您共选择"+choicess.length+"门课程,总学分为:"+sum+"分";
</script>
</html>
