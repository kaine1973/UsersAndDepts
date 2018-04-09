<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<head>
    <title>dept</title>
</head>
<body>
<center>
    <h2>部门列表</h2>
    <strong><a href="/dept/showInsertDept">添加部门</a></strong>
    <table border="1">
        <tr>
            <th>部门编号</th>
            <th>部门名</th>
            <th>部门等级</th>
            <th>操作</th>
        </tr>
        <c:if test="${ fn:length(depts) == 0}">
            <tr><td colspan="3"><strong>暂无数据</strong></td></tr>
        </c:if>
        <c:forEach items="${depts}" var="dept">
            <tr>
                <td>${dept.deptCode}</td>
                <td>${dept.deptName}</td>
                <td>
                    <c:choose>
                        <c:when test="${dept.deptLevel == 1}">
                            部门
                        </c:when>
                        <c:when test="${dept.deptLevel == 2}">
                            地区
                        </c:when>
                        <c:when test="${dept.deptLevel == 3}">
                            分部
                        </c:when>
                        <c:otherwise>
                            为定义
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="javascript:deleteDept(${dept.deptId})">删除</a>&nbsp;
                    <a href="/dept/showUpdateDept?deptId=${dept.deptId}">修改</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <strong><a href="/index.jsp" >返回首页</a></strong>
</center>
</body>
<script>
    function deleteDept(id) {
        var conf = window.confirm("确定删除该部门？");
        if(conf){
            $.ajax({
                url:"/dept/deleteDept",
                type:"post",
                data:"deptId="+id,
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
