<%--suppress ALL --%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>--%>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%
        Map<String, Object> map = (Map<String, Object>) session.getAttribute("k_info");
    %>

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
        })
    </script>
    <c:if test="${map != null}">
        <script>
            $(function () {
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
                        })
                    })
            })
        </script>
    </c:if>
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

<nav class="navbar navbar-collapse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img src="../statics/images/1.png" height="55" width="50">
                    <span style="font-size: 30px;color: #0000FF;font-weight: 900;">  -star</span>
                    <span style="font-size: 30px;">
                                <span style="color: #969696; font-size: 26px;font-weight: 900">
                                    <b>&nbsp;一站式快递服务</b>
                                </span>
                        </span>
                </div>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right">

            <c:if test="${map == null}">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </c:if>
            <c:if test="${map != null}">
                <li><a href="#"> 首页</a></li>
                <li><a href="#"> 发布任务</a></li>
                <li><a href="#"> 帮忙取快递</a></li>
                <li><a href="#"> 我的</a></li>
                <li><a href="#" data-toggle="tooltip" data-placement="bottom" class="tooltip-options"
                       title="<div>
                                <dl>
                                    <dt>
                                        <img src='../statics/images/info.png'><span> <%=map.get("k_username")%></span>
                                    </dt>
                                    <dt>
                                        <img src='../statics/images/qq.png'><span>QQ:<%=map.get("k_qq")%></span>
                                    </dt>
                                    <dt>
                                        <img src='../statics/images/weChat.png'><span>QQ:<%=map.get("k_weChat")%></span>
                                    </dt>
                                    <dt>
                                        <img src='../statics/images/phone.png'><span>QQ:<%=map.get("k_phone")%></span>
                                    </dt>
                                </dl>
                            </div>"><span class="glyphicon glyphicon-user"></span></a></li>
            </c:if>
        </ul>
    </div>
</nav>

<script>
    $(function () {
        $(".tooltip-options").tooltip({html: true});
    })
</script>
<%--<div>--%>
<%--<ul id="title">--%>
<%--<li id="one">我的快递</li>--%>
<%--<li id="two"><a href="/views/message.jsp">我的消息</a></li>--%>
<%--<li id="three"><a href="/views/forum.jsp"> 我的论坛</a></li>--%>
<%--<li id="four"><a href="/views/release.jsp">发布任务</a></li>--%>
<%--</ul>--%>
<%--</div>--%>

<div style="width: 1349px; height: 540px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1;
background-size: cover; background: url(/statics/images/3.png) no-repeat 50% 50%;">
    <div style="text-align: left;">
        <div style="position: absolute; top: 148px; left: 434px; width: 476px; height: 158px;">
            <div>
                <table>
                    <tr>
                        <td><img src="../statics/images/1.png"></td>
                        <td>
                            <b>
                                <span style="font-size: 84px;color: rgb(255, 255, 255);">  -star</span>
                            </b>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <p>
                    <font color="#1e50ae">
                        <span style="font-size: 30px;">
                                <span style="color: rgb(100, 181, 246); font-size: 36px;">
                                    <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一站式快递服务</strong>
                                </span>
                        </span>
                    </font>
                </p>
            </div>
        </div>

        <div style="position: absolute; top: 326px; left: 400px; width: 500px; height: 87px;" id="myOne">
            <table style="height:87px; width: 500px" cellpadding="0" cellspacing="0">
                <div style="color: white;width: 350px;text-align: left">
                    <tr>
                        <td width="40%">
                            <input type="text" maxlength="100" style="height: 41px;width: 100%" name="orderNumber"
                                   id="orderNumber"
                                   placeholder="输入快递单号"/>
                        </td>
                        <td width="10%">
                            <div style="background-color:#1e50ae;height:41px;width: 100%;" href="">
                                <center><span style="color: rgb(255, 255, 255);line-height:41px;font-size:30px;"
                                              id="cli"
                                              class="glyphicon glyphicon-search"></span></center>
                            </div>
                        </td>
                    </tr>
                </div>
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
    </div>
</div>

<%--<div id="myOne">--%>
<%--<form action="/kuaidi/chaxun" method="post">--%>
<%--<table>--%>
<%--<tr><input type="text" name="orderNumber" id="orderNumber" value="${orderNumber }"--%>
<%--placeholder="请输入你想要查询的快递单号"/></tr>--%>
<%--<td><input type="submit" id="cli" value="查询"/></td>--%>
<%--</table>--%>
<%--<select name="type" id="type">--%>
<%--<option value="zhongtong" <c:if test="${type eq 'zhongtong'}">selected</c:if>>中通</option>--%>
<%--<option value="yunda" <c:if test="${type eq 'yunda'}">selected</c:if>>韵达</option>--%>
<%--<option value="yuantong" <c:if test="${type eq 'yuantong'}">selected</c:if>>圆通</option>--%>
<%--<option value="huitongkuaidi" <c:if test="${type eq 'huitongkuaidi'}">selected</c:if>>百世快递</option>--%>
<%--<option value="shentong" <c:if test="${type eq 'shentong'}">selected</c:if>>申通</option>--%>
<%--<option value="wanxiangwuliu" <c:if test="${type eq 'wanxiangwuliu'}">selected</c:if>>万象物流</option>--%>
<%--<option value="ems" <c:if test="${type eq 'ems'}">selected</c:if>>EMS物流</option>--%>
<%--</select>--%>
<%--<c:if test="${time != null && context != null}">--%>
<%--<ul id="main">--%>
<%--<li id="first">time: ${time} --> context: ${context}</li>--%>
<%--<ul id="mineGd"></ul>--%>
<%--<a href="javascript:void(0)" id="gd">获取更多</a>--%>
<%--</ul>--%>
<%--</c:if>--%>
<%--</form>--%>
<%--<ul id="mineOne">--%>
<%--<li>我的快递</li>--%>
<%--</ul>--%>
<%--<c:if test="${gd2List != null}">--%>
<%--<ul>--%>
<%--<%--%>
<%--List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("gd2List");--%>
<%--if (list != null) {--%>
<%--Map<String, Object> map1 = new HashMap<>();--%>
<%--map1 = list.get(0);--%>
<%--%>--%>
<%--<li><%=map1.get("k_type")%>--><%=map1.get("k_number")%>--%>
<%--</li>--%>
<%--<%--%>
<%--for (int i = 0; i < list.size(); i++) {--%>
<%--map1 = new HashMap<>();--%>
<%--map1 = list.get(i);--%>
<%--%>--%>
<%--<li><%=map1.get("k_time")%>--><%=map1.get("k_context")%>--%>
<%--</li>--%>
<%--<%--%>
<%--}--%>
<%--}--%>
<%--%>--%>
<%--</ul>--%>
<%--</c:if>--%>
<%--</div>--%>

<div id="myTwo">

</div>

<div id="myThree">


</div>

</body>
</html>
