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
                        list += content.k_infoName + "-->" + "<a href='/kuaidi/messageDetail?type=mine&number=" + content.k_reNumber + "&status="+ content.k_reStatus +"'>" + content.k_reText + "</a>"
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
                        list += "<a href='/kuaidi/messageDetail?type=other&number=" + content.k_me_number + "&status="+ content.k_meStatus +"'>" + context + "</a>" +
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
            var status_m = "<%=request.getAttribute("status_m")%>";
            if (status_m == 2){
                $("#a_status").html("任务已完成");
                $("#a_status").click(function () {
                    alert("该任务已完成！");
                })
            }else if (status_m == 3){
                $("#a_status").html("任务已过期");
                $("#a_status").click(function () {
                    alert("该任务已过期！");
                })
            }
            var status_o = "<%=request.getAttribute("status_o")%>";
            if (status_o == 2){
                $("#a_status1").html("任务已完成");
                $("#a_status1").click(function () {
                    alert("该任务已完成！");
                });
                $("#a_status2").html("任务已完成");
                $("#a_status2").click(function () {
                    alert("该任务已完成！");
                });
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
                        <a href="/kuaidi/messageDone?number=${mapDetail.k_me_number}&k_infoId=${mapDetail.k_me_otherId}&type=accept" id="a_status">任务完成</a>
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

                <c:if test="${mapDetail.k_me_myId eq id }">
                    <tr>
                        <td>详细信息</td>
                        <td>${mapDetail.k_meWarn }</td>
                    </tr>
                    <tr>
                        <td><a href="/views/message.jsp">确认</a></td>
                        <td>
                            <a href="/kuaidi/messageDone?number=${mapDetail.k_me_number}&k_infoId=${mapDetail.k_me_otherId}&type=release
                         &kind=other" id="a_status1">任务完成</a>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${mapDetail.k_me_otherId eq id }">
                    <tr>
                        <td>详细信息</td>
                        <td>${mapDetail.k_meOtherWarn }</td>
                    </tr>
                    <tr>
                        <td><a href="/views/message.jsp">确认</a></td>
                        <td>
                            <a href="/kuaidi/messageDone?number=${mapDetail.k_me_number}&k_infoId=${mapDetail.k_me_myId}&type=release
                         &kind=mine" id="a_status2">任务完成</a>
                        </td>
                    </tr>
                </c:if>
            </table>
        </c:if>
    </div>
</c:if>
</body>
</html>
