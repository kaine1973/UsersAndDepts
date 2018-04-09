<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<head>
    <title>查看用户</title>
</head>
<body>
<center>
    <h2>查看用户</h2>
    <strong><a href="/user/showInsertUser">添加用户</a></strong>
<table border="1">
    <tr>
        <th>用户名</th>
        <th>真实姓名</th>
        <th>密码</th>
        <th>所属部门</th>
        <th>生日</th>
        <th>手机号码</th>
        <th>操 作</th>
    </tr>
    <c:if test="${ fn:length(users) == 0}">
        <tr><td colspan="6"><strong>暂无数据</strong></td></tr>
    </c:if>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.userName}</td>
            <td>${user.trueName}</td>
            <td>${user.password}</td>
            <td>
                <c:forEach items="${depts}" var="dept">
                    <c:if test="${dept.deptId == user.deptId}">
                        ${dept.deptName}
                    </c:if>
                </c:forEach>
            </td>
            <td>${user.birthday}</td>
            <td>${user.cellphone}</td>
            <td><a href="javascript:deleteUser(${user.id})">删除</a>
            <a href="/user/showAlterUser?userId=${user.id}">修改</a></td>
        </tr>
    </c:forEach>
</table>

<br/>
</center>
</body>
<script>
    function deleteUser(id) {
        var conf = window.confirm("确定删除该员工？");
        if(conf){
            $.ajax({
                url:"/user/deleteUser",
                type:"post",
                data:"userId="+id,
                success:function (data) {
                    alert(data.msg);
                    if (data.code == 200){
                        window.location.reload()
                    }
                },
                error:function () {
                    alert("出错了");
                }
            })
        }
    }
</script>
</html>
