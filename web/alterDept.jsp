<%--
  Created by IntelliJ IDEA.
  User: kaidan
  Date: 2018/4/9
  Time: 下午1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>${dept == null ?"添加部门":"修改部门"}</title>
</head>
<body>
<CENTER>
    <H2>${dept == null ?"添加部门":"修改部门"}</H2>
    <form id="dept" method="post" ${dept == null ?"action='/dept/insertDept'":"action='/dept/updateDept'"}>
        <input hidden="hidden" name="deptId" value="${dept.deptId}">
        <table>
            <tr><td>部门编号：</td><td><input type="text" name="deptCode"/></td></tr>
            <tr><td>部 门 名：</td><td><input type="text" name="deptName"/></td></tr>
            <tr><td>部门等级：</td><td>
                <select name="deptLevel">
                    <option value="1"
                            <c:if test="${dept.deptLevel == 1}">
                                selected="selected"
                            </c:if>
                    >部门</option>
                    <option value="2"
                            <c:if test="${dept.deptLevel == 2}">
                                selected="selected"
                            </c:if>
                    >地区</option>
                    <option value="3"
                            <c:if test="${dept.deptLevel == 3}">
                                selected="selected"
                            </c:if>
                    >分部</option>
                </select>
            </td></tr>
            <tr><td><input type="submit" value="提交" /></td><td></td></tr>
        </table>
    </form>
</CENTER>
</body>
</html>
