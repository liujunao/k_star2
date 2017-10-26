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
<%@ include file="reCommon.jsp" %>
<html>
<head>
    <title>帮忙取快递</title>
    <script src="/statics/js/alertCommon.js"></script>
    <script type="text/javascript">
        $(function () {
            $.post(
                "/kuaidi/forumAll",
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data), function (num, content) {
                        list += "<li>";
                        list += content.k_infoName + "-->" + "<a href='/kuaidi/forumDetail?number=" + content.k_reNumber + "'>" + content.k_reText + "</a>"
                            + status(content.k_reStatus);
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
            var mapDetail = "<%=request.getAttribute("mapDetail")%>";
            if (mapDetail != null && mapDetail != "null") {
                var st = $("#status").val();
                if (st == 1) {
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("该快递已被领取！");
                    })
                }
                if (st == 2) {
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("该快递任务已被接受！");
                    })
                }
                if (st == 3) {
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("截至时间已过，该任务失效");
                    })
                }
            }
            var infoId = "<%=map.get("k_id")%>";
            if ($("#infoId") == infoId){
                $("#a_status").html("领取任务");
                $("#a_status").click(function () {
                    alert("您不能领取自己发布的任务！");
                })
            }
        })
        var msg = "<%=request.getAttribute("msg")%>";
        window.onload = mine(msg);

    </script>
</head>
<body>

<div>
    <ul id="title">
        <li id="one"><a href="/views/index.jsp">我的快递</a></li>
        <li id="two"><a href="/views/message.jsp">我的消息</a></li>
        <li id="three"><a href="#"> 我的论坛</a></li>
        <li id="four"><a href="/views/release.jsp">发布任务</a></li>
    </ul>
</div>

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
                <td><input type="hidden" value="${mapDetail.k_reStatus }" id="status"/></td>
            </tr>
            <tr>
                <td><input type="hidden" value="${mapDetail.k_re_infoId }" id="infoId"/></td>
            </tr>
            <tr>
                <td><a href="/views/forum.jsp">确认</a></td>
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String date = simpleDateFormat.format(new Date());
                %>
                <td id="a_status"><a href="/kuaidi/forumTask?k_reStatus=2&k_reId=${mapDetail.k_reId }&username=${mapDetail.k_infoName}&meTime=<%=date%>">领取任务</a>
                </td>
            </tr>
        </table>
    </div>
</c:if>
</body>
</html>
