<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/7
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="reCommon.jsp"%>
<html>
<head>
    <title>我的消息</title>
    <script src="/statics/js/jquery-3.2.1.js"></script>
    <script src="/statics/js/alertCommon.js"></script>

    <%
        Map<String, Object> map = (Map<String, Object>) session.getAttribute("k_info");
    %>
    <script type="text/javascript">

        $(function () {
            $.post(
                "kuaidi/puMessage",
                {
                    "k_re_infoId": <%=map.get("k_id")%>
                },
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data),function (num,content) {
                        list += "<li>";
                        list += content.k_infoName + "-->" + "<a href='/kuaidi/forumDetail?number="+ content.k_reNumber +"'>" +content.k_reText + "</a>"
                            + status(content.k_reStatus);
                        list += "</li>";
                        $("#mine").html(list);
                    })
                }
            )
        })
    </script>
</head>
<body>

<div id="myThree">
    <ul id="mine">
        <li>我发布的消息</li>
    </ul>
    <ul id="other">
        <li>其他消息</li>
    </ul>
</div>

</body>
</html>
