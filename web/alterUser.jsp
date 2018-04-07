<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>${user==null?"添加用户":"修改用户" }</title>
</head>
<body>
<h2>${user==null?"添加用户":"修改用户" }</h2>
<form id="myform" method="post" action="${user==null?"/user/insertUser":"/user/updateUser" }">
    <input type="hidden" name="id" value="${user.id}"/><br/>
    姓名：<input type="text" name="userName" value="${user.userName}"/><br/>
所属部门：
    <select name="deptNo" form="myform"><br/>
        <c:forEach items="${depts}" var="dept">
            <option value="${dept.id}" ${(user.deptNo == dept.id)?"selected=\"selected\"":"" }>${dept.deptName}</option>
        </c:forEach>
    </select><br/>
    <input type="submit" value="保存"><input type="button" onclick="javascript:history.go(-1)" value="取消"/>
</form>
</body>
</html>
