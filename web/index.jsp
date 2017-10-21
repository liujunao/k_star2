<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/9/26
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <a href="${pageContext.request.contextPath}/views/index.jsp">查询页面</a>

  <br><br>
  <a href="${pageContext.request.contextPath}/views/register.jsp">注册页面</a>

  <br><br>
  <a href="${pageContext.request.contextPath}/views/login.jsp">登录页面</a>
  <br><br>
  <a href="${pageContext.request.contextPath}/kuaidi/chaxunGd2?orderNumber2=71092966476706">测试</a>
  <br><br>
  <a href="/views/chat.jsp">点击</a>
  </body>

<script>
    function c() {
        window.location = "http://www.baidu.com";
    }
</script>
</html>
