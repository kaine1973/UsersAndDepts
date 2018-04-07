<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>dept</title>
</head>
<body>

<table >
    <tr>
        <th hidden="hidden"></th><th>部门名</th><th>部门编号</th><th>级别</th><th>操作</th>
    </tr>

    <c:forEach items="${depts}" var="dept">
        <tr><td hidden="hidden" id="row${dept.id}"></td><td>${dept.deptName}</td><td>${dept.deptCode}</td>
            <td>
                <c:choose>
                    <c:when test="${dept.deptLevel == 1}">
                        总部
                    </c:when>
                    <c:when test="${dept.deptLevel == 2}">
                        地区
                    </c:when>
                    <c:when test="${dept.deptLevel == 3}">
                        怎么说
                    </c:when>
                    <c:otherwise>
                        未定
                    </c:otherwise>
                </c:choose>
            </td>
            <td><a href="javascript:deleteDept(${dept.id})">删除</a><a href="javascript:alterDept(${dept.id})">修改</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
