<%--suppress ALL --%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的主页</title>
    <script src="/statics/js/jquery-3.2.1.js"></script>

    <script type="text/javascript">
        $(function () {
            var result = "";
            $("#gd").click(function () {
                $.post(
                    "/kuaidi/chaxunGd",
                    {
                        "orderNumber": $("#orderNumber").val()
                    }, function (data) {
                        var list = "";
                        $.each($.parseJSON(data), function (name, content) {
                            list += "<li>";
                            list += "time: " + content.k_time + " --> context:" + content.k_context;
                            list += "</li>";
                            $("#mineGd").html(list);
                        })
                    }
                );
                if ($("#first").css("display") == "none") {
                    $("#first").show();
                } else {
                    $("#first").hide();
                }
                if ($("#mineGd").css("display") == "none") {
                    $("#mineGd").show();
                } else {
                    $("#mineGd").hide();
                }
            });
            var gdHIndex = 0;
            $.post(
                "/kuaidi/showMine",
                function (data) {
                    var mapList = "";
                    $.each($.parseJSON(data), function (name, content) {
                        mapList += "<li>";
                        mapList += content.k_time + "-->" + "<a href='/kuaidi/chaxunGd2?orderNumber2=" + content.k_number + "'>"
                            + content.k_context + "</a>" + "-->" + content.k_type;
                        mapList += "</li>";
                        $("#mineOne").html(mapList);
                        gdHIndex++;
                    })
                })
        })
    </script>
    <style>
        #title li {
            display: inline-block;
            list-style: none;
            width: 20%
        }

        #mineGd {
            display: none;
        }
    </style>
    <script>
        function typeToString(type) {
            var result = "";
            if (type == "中通") {
                result = "zhongtong";
            }
            if (type == "韵达") {
                result = "yunda";
            }
            if (type == "圆通") {
                result = "yuantong";
            }
            if (type == "百世快递") {
                result = "huitongkuaidi";
            }
            if (type == "申通") {
                result = "shentong";
            }
            if (type == "万象物流") {
                result = "wanxiangwuliu";
            }
            if (type == "EMS物流") {
                result = "ems";
            }
            return result;
        }

        function mine() {
            var msg = "<%=request.getAttribute("msg")%>";
            if (msg != null && msg != "null") {
                alert(msg);
            }
        }
        window.onload = mine;
    </script>

</head>
<body>

<%
    Map<String, Object> map = (Map<String, Object>) session.getAttribute("k_info");
%>
用户名：<%=map.get("k_username")%>
电话号码：<%=map.get("k_phone")%>
QQ:<%=map.get("k_qq")%>
微信:<%=map.get("k_weChat")%>
<a href="/kuaidi/supplement">信息变更</a>
<br><br><br><br>

<div>
    <ul id="title">
        <li id="one">我的快递</li>
        <li id="two">我的消息</li>
        <li id="three"><a href="/views/forum.jsp"> 我的论坛</a></li>
        <li id="four"><a href="/views/release.jsp">发布任务</a></li>
    </ul>
</div>

<div id="myOne">
    <form action="/kuaidi/chaxun" method="post">
        <table>
            <tr><input type="text" name="orderNumber" id="orderNumber" value="${orderNumber }"
                       placeholder="请输入你想要查询的快递单号"/></tr>
            <td><input type="submit" id="cli" value="查询"/></td>
        </table>
        <select name="type" id="type">
            <option value="zhongtong" <c:if test="${type eq 'zhongtong'}">selected</c:if>>中通</option>
            <option value="yunda" <c:if test="${type eq 'yunda'}">selected</c:if>>韵达</option>
            <option value="yuantong" <c:if test="${type eq 'yuantong'}">selected</c:if>>圆通</option>
            <option value="huitongkuaidi" <c:if test="${type eq 'huitongkuaidi'}">selected</c:if>>百世快递</option>
            <option value="shentong" <c:if test="${type eq 'shentong'}">selected</c:if>>申通</option>
            <option value="wanxiangwuliu" <c:if test="${type eq 'wanxiangwuliu'}">selected</c:if>>万象物流</option>
            <option value="ems" <c:if test="${type eq 'ems'}">selected</c:if>>EMS物流</option>
        </select>
        <c:if test="${time != null && context != null}">
            <ul id="main">
                <li id="first">time: ${time} --> context: ${context}</li>
                <ul id="mineGd"></ul>
                <a href="javascript:void(0)" id="gd">获取更多</a>
            </ul>
        </c:if>
    </form>
    <ul id="mineOne">
        <li>我的快递</li>
    </ul>
    <c:if test="${gd2List != null}">
        <ul>
            <%
                List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("gd2List");
                if (list != null) {
                    Map<String, Object> map1 = new HashMap<>();
                    map1 = list.get(0);
            %>
            <li><%=map1.get("k_type")%>--><%=map1.get("k_number")%>
            </li>
            <%
                for (int i = 0; i < list.size(); i++) {
                    map1 = new HashMap<>();
                    map1 = list.get(i);
            %>
            <li><%=map1.get("k_time")%>--><%=map1.get("k_context")%>
            </li>
            <%
                    }
                }
            %>
        </ul>
    </c:if>
</div>

<div id="myTwo">

</div>

<div id="myThree">


</div>

</body>
</html>
