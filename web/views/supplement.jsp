<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/3
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息变更</title>

    <script>
        function mine() {
            var msg = "<%=request.getAttribute("msg")%>";
            if (msg != null && msg != "null"){
                alert(msg);
            }
        }
        window.onload = mine;
    </script>
</head>
<body>

    <%
        Map<String,Object> map = (Map<String, Object>) request.getSession().getAttribute("k_info");
    %>

    <form action="/kuaidi/supplement" method="post">
        <table>
            <tr>
                <td>用户名：</td>
                <td><input type="text" name="k_username" value="<%=map.get("k_username")%>"/></td>
            </tr>
            <tr>
                <td>电话号码：</td>
                <td><input type="text" name="k_phone" value="<%=map.get("k_phone")%>"/></td>
            </tr>
            <tr>
                <td>QQ号：</td>
                <td><input type="text" name="k_qq" value="<%=map.get("k_qq")%>"/></td>
            </tr>
            <tr>
                <td>微信号：</td>
                <td><input type="text" name="k_weChat" value="<%=map.get("k_weChat")%>"/></td>
            </tr>
            <tr>
                <td>电子邮箱：</td>
                <td><input type="email" name="k_email" value="<%=map.get("k_email")%>"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="提交"/></td>
            </tr>
        </table>
    </form>

</body>
</html>
