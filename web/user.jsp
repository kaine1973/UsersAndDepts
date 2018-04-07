<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<head>
    <title>查看用户</title>
</head>
<body>
<table>
    <tr>
        <th>姓名</th><th>所属部门</th><th>操作</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr><td hidden="hidden" id="row${user.id}"></td>
            <td>${user.userName}</td>
            <td>${user.deptName}</td>
            <td><a href="javascript:deleteUser(${user.id})">删除</a>
            <a href="/user/alterUser?userId=${user.id}">修改</a></td>
        </tr>
    </c:forEach>
</table>

<br/>
<a href="/user/alterUser">添加用户</a>
</body>
<script>
    function deleteUser(id) {
        var conf = window.confirm("确定删除该员工？");
        if(conf){
            $.ajax({
                url:"deleteUser",
                type:"post",
                data:"id="+id,
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
