<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/2
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="reCommon.jsp" %>
<html>
<head>
    <title>结果页面</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>
<center>
    <div style="top: 50%;">
        <h1>${msg}...</h1>
        <c:if test="${message == 'register'}">
            <a href="${pageContext.request.contextPath}/views/login.jsp">
                <button value="已完成邮箱验证" class="btn btn-success"></button>
            </a>
        </c:if>
        <c:if test="${message == 'revise'}">
            <a href="${pageContext.request.contextPath}/views/index.jsp">
                <button value="已完成邮箱验证" class="btn btn-success"></button>
            </a>
        </c:if>
    </div>
</center>
</body>
</html>
