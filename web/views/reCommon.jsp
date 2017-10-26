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

    <script>
        $(function () {
            $("[data-toggle='popover']").popover();
        });
    </script>

</head>
<body>

<%
    Map<String, Object> map = (Map<String, Object>) session.getAttribute("k_info");
%>

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
            <li><a href="/views/index.jsp"> 首页</a></li>
            <li><a href="/views/release.jsp"> 发布任务</a></li>
            <li><a href="/views/forum.jsp"> 帮忙取快递</a></li>
            <li><a href="/views/message.jsp"> 我的</a></li>
            <li><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user"></span>
                </a>
                <div class="dropdown-menu">
                    <dl>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<img src='../statics/images/info.png' style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;"><%=map.get("k_username")%></span>
                        </dt>
                        <dt><br></dt>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<img src='../statics/images/qq.png' style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;"><%=map.get("k_qq")%></span>
                        </dt>
                        <dt><br></dt>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<img src='../statics/images/weChat.png' style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;"><%=map.get("k_weChat")%></span>
                        </dt>
                        <dt><br></dt>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<img src='../statics/images/phone.png' style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;"><%=map.get("k_phone")%></span>
                        </dt>
                        <dt><br></dt>
                        <dt>&nbsp;&nbsp;&nbsp;
                            <a href='/kuaidi/supplement'>
                                <span class='glyphicon glyphicon-asterisk' style='color: #808080;width: 20px;height: 20px;font-weight: 400;text-align: left'></span>
                            </a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#">
                                <span class='glyphicon glyphicon-log-out' style='color: #808080;width: 20px;height: 20px;font-weight: 400;text-align: right'></span>
                            </a>
                        </dt>
                    </dl>
                </div>
            </li>
        </ul>
    </div>
</nav>

</body>
</html>
