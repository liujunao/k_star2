<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/6
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="reCommon.jsp"%>
<html>
<head>
    <title>我的论坛</title>
    <script type="text/javascript" src="/statics/js/jquery-3.2.1.js"></script>
    <script src="/statics/js/alertCommon.js"></script>
    <script type="text/javascript">
        $(function () {
            $.post(
                "/kuaidi/forumAll",
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data),function (num,content) {
                        list += "<li>";
                        list += content.k_infoName + "-->" + "<a href='/kuaidi/forumDetail?number="+ content.k_reNumber +"'>" +content.k_reText + "</a>"
                        + status(content.k_reStatus);
                        list += "</li>";
                        $("#mineThree").html(list);
                    })
                }
            )
            $.post(
                "/kuaidi/examineTime",
                {
                    "timeout":new Date()
                }
            )
            var message = "<%=request.getAttribute("message")%>";
            if (message != null && message != "null") {
                if ($("#myThree").css("display") != "none") {
                    $("#myThree").hide();
                }
            }
        })
        var msg = "<%=request.getAttribute("msg")%>";
        window.onload = mine(msg);

    </script>
</head>
<body>

<div id="myThree">
    <ul id="mineThree"></ul>
</div>

</body>
</html>
