<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/7
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>
</head>
<body>

<%
    Map<String, Object> map = (Map<String, Object>) session.getAttribute("k_info");
%>
用户名：<%=map.get("k_username")%>
电话号码：<%=map.get("k_phone")%>
QQ:<%=map.get("k_qq")%>
微信:<%=map.get("k_weChat")%>
<a href="/kuaidi/supplement">信息变更</a>
<br><br><br><br>

<nav class="navbar navbar-collapse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img src="../statics/images/1.png" height="55" width="50">
                    <span style="font-size: 30px;color: #0000FF;font-weight: 900;">  -star</span>
                    <span style="font-size: 30px;">
                                <span style="color: #969696; font-size: 26px;font-weight: 900">
                                    <b>&nbsp;一站式快递服务</b>
                                </span>
                        </span>
                </div>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"> 首页</a></li>
            <li><a href="#"> 发布任务</a></li>
            <li><a href="#"> 帮忙取快递</a></li>
            <li><a href="#"> 我的</a></li>
        </ul>
    </div>
</nav>

</body>
</html>
