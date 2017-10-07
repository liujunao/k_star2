<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
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
    <script src="/statics/js/jquery-3.2.1.js"></script>

    <script type="text/javascript">
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
    </script>
</head>
<body>

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
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String date = simpleDateFormat.format(new Date());
                %>
                <td id="a_status"><a href="/kuaidi/forumTask?k_reStatus=2&k_reId=${mapDetail.k_reId }&meTime=<%=date%>">领取任务</a> </td>
            </tr>
        </table>
    </div>
</c:if>
</body>
</html>
