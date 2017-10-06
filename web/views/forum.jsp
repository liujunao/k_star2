<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/6
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        list += content.k_infoName + "-->" + "<a href='/kuaidi/forumDetail?number="+ content.k_reNumber +"'>" +content.k_reText + "</a>";
                        list += "</li>";
                        $("#mineThree").html(list);
                    })
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
<c:if test="${mapDetail != null}">
    <div id="show">
        <table>
            <tr>
                <td>快递单号</td>
                <td>${mapDetail.k_reNumber}</td>
            </tr>
            <tr>
                <td>取件人姓名</td>
                <td>${mapDetail.k_reName}</td>
            </tr>
            <tr>
                <td>取件人手机号码</td>
                <td>${mapDetail.k_rePhone}</td>
            </tr>
            <tr>
                <td>领取截至时间</td>
                <td>${mapDetail.k_reTime}</td>
            </tr>
            <tr>
                <td>取件详细信息</td>
                <td>${mapDetail.k_reText}</td>
            </tr>
            <tr>
                <td><a href="/views/forum.jsp">确认</a></td>
            </tr>
        </table>
    </div>
</c:if>
</body>
</html>
