<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/7
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="reCommon.jsp" %>
<html>
<head>
    <title>我的消息</title>
    <link type="text/css" rel="stylesheet" href="/statics/css/styleCommon.css"/>
    <script src="/statics/js/jquery-3.2.1.js"></script>
    <script src="/statics/js/alertCommon.js"></script>
    <script type="text/javascript">

        var id = "<%=map.get("k_id")%>";
        $(function () {
            $.post(
                "/kuaidi/puMessage",
                {
                    "k_re_infoId": id
                },
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data), function (num, content) {
                        list += "<li>";
                        list += content.k_infoName + "-->" + "<a href='/kuaidi/messageDetail?type=mine&number=" + content.k_reNumber + "'>" + content.k_reText + "</a>"
                            + status(content.k_reStatus);
                        list += "</li>";
                        $("#mine").html(list);
                    })
                }
            )
            $.post(
                "/kuaidi/messageMine",
                {
                    "k_me_myId": id
                },
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data), function (num, content) {
                        list += "<li>";
                        var context = "";
                        var name = "";
                        var k_id = "";
                        if (content.k_me_myId == id) {
                            context = content.k_meWarn;
                            name = content.k_me_otherUsername;
                            k_id = content.k_me_otherId;
                        } else {
                            context = content.k_meOtherWarn;
                            name = content.k_me_myUsername;
                            k_id = content.k_me_myId;
                        }
                        list += "<a href='/kuaidi/messageDetail?&type=other&number=" + content.k_me_number + "'>" + context + "</a>" +
                                "<a href='/kuaidi/chat?k_id=" + k_id + "'>" + name + "</a> " + status(content.k_meStatus);
                        list += "</li>";
                        $("#myOther").html(list);
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

<div>
    <ul id="title">
        <li id="one"><a href="/views/index.jsp">我的快递</a></li>
        <li id="two"><a href="#">我的消息</a></li>
        <li id="three"><a href="/views/forum.jsp"> 我的论坛</a></li>
        <li id="four"><a href="/views/release.jsp">发布任务</a></li>
    </ul>
</div>


<div id="myThree">
    我发布的消息
    <ul id="mine"></ul>
    其他消息
    <ul id="myOther"></ul>
</div>

<c:if test="${mapDetail != null}">
    <div id="show">
        <c:if test="${moType eq 'myMine' }">
            <table>
                <tr>
                    <td>快递单号</td>
                    <td>${mapDetail.k_reNumber}</td>
                </tr>
                <tr>
                    <td>详细信息</td>
                    <td>${mapDetail.k_reText}</td>
                </tr>
                <tr>
                    <td><a href="/views/message.jsp">确认</a></td>
                    <td>
                        <a href="/kuaidi/messageDone?number=${mapDetail.k_me_number}&k_infoId=${mapDetail.k_me_otherId}&type=accept">任务完成</a>
                    </td>
                </tr>
            </table>
        </c:if>
        <c:if test="${moType eq 'myOther' }">
            <table>
                <tr>
                    <td>快递单号</td>
                    <td>${mapDetail.k_me_number }</td>
                </tr>
                <tr>
                    <td>详细信息</td>
                    <c:if test="${mapDetail.k_me_myId eq id }">
                        <td>${mapDetail.k_meWarn }</td>
                    </c:if>
                    <c:if test="${mapDetail.k_me_otherId eq id }">
                        <td>${mapDetail.k_meOtherWarn }</td>
                    </c:if>
                </tr>
                <tr>
                    <td><a href="/views/message.jsp">确认</a></td>
                    <td>
                        <a href="/kuaidi/messageDone?number=${mapDetail.k_me_number}&k_infoId=${mapDetail.k_me_myId}&type=release">任务完成</a>
                    </td>
                </tr>
            </table>
        </c:if>
    </div>
</c:if>

<c:if test="${done != null}">
    <div id="evaluate">
        <c:if test="${evaluate == 'evRelease'}">

        </c:if>
        <c:if test="${evaluate == 'evAccept'}">

        </c:if>
    </div>
</c:if>
</body>
</html>
