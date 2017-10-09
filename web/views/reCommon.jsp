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

</body>
</html>
