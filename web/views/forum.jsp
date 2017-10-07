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
            var mapDetail = "<%=request.getAttribute("mapDetail")%>";
            if (mapDetail != null && mapDetail != "null"){
                if ($("#status").val() == 1){
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("该快递已被领取！");
                    })
                }
                if ($("#status").val() == 2){
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("该快递任务已被接受！");
                    })
                }
                if ($("#status").val() == 3){
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("截至时间已过，该任务失效");
                    })
                }
            }


        })
        var msg = "<%=request.getAttribute("msg")%>";
        window.onload = mine(msg);
        function status(k_status) {
            if (k_status == 0){
                return"未领取";
            }else if (k_status == 1){
                return"已领取";
            }else if (k_status == 2){
                return"任务已接受";
            }else if (k_status == 3){
                return"截至时间已过";
            }
        }
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
                <td><input type="hidden" value="${mapDetail.k_reStatus }" id="status"/></td>
            </tr>
            <tr>
                <td><a href="/views/forum.jsp">确认</a></td>
                <td id="a_status"><a href="/kuaidi/forumTask?k_reStatus=2&k_reId=${mapDetail.k_reId }">领取任务</a> </td>
            </tr>
        </table>
    </div>
</c:if>
</body>
</html>
