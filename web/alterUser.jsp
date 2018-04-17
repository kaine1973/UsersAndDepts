<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>${user==null?"添加用户":"修改用户" }</title>
</head>
<body>
<center>

<h2>${user==null?"添加用户":"修改用户" }</h2>

<form id="myform" method="post" action="${user==null?"/user/insertUser":"/user/updateUser" }">
    <input name="userId" value="${user.userId}" hidden="hidden">
    <table>
        <tr><td>用 户 名：</td><td><input type="text" name="userName" value="${user.userName}"></td></tr>
        <tr><td>真实姓名：</td><td><input type="text" name="trueName" value="${user.trueName}"></td></tr>
        <tr><td> 密  码：</td><td><input type="text" name="password" value="${user.password}"></td></tr>
        <tr><td>所属部门</td><td>
            <select name="deptId">
                <c:forEach items="${depts}" var="dept">
                    <option value="${dept.deptId}" ${dept.deptId == user.deptId ?"selected='selected'":""}>${dept.deptName}</option>
                </c:forEach>
            </select>
            <c:if test="${fn:length(depts)==0}">
                <span style="font-size: small">暂无部门，请先<a href="/dept/showInsertDept">添加部门</a></span>
            </c:if>
        </td></tr>
        <tr><td>出生日期</td><td><input type="text" name="birthday" value="${user.birthday}"></td></tr>
        <tr><td>电话号码</td><td><input type="text" name="cellphone" value="${user.cellphone}"></td></tr>
        <tr><td><input type="submit" value="保存"></td><td><input type="button" onclick="javascript:history.go(-1)" value="取消"/></td></tr>
    </table>

</form>
</center>
</body>
</html>
