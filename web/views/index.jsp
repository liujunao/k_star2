<%--suppress ALL --%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="reCommon.jsp" %>
<html>
<head>
    <title>首页</title>
    <%--<link rel="stylesheet" href="/statics/css/bootstrap.css"/>--%>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--<script type="text/javascript" src="/statics/js/bootstrap.min.js"></script>--%>
    <script type="text/javascript">
        $(function () {
            $("#cli").click(function () {
                $.post(
                    "/kuaidi/chaxunTitle",
                    {
                        "type":$("#type").val()
                    },function (data) {
                        var result = "";
                        $.each($.parseJSON(data),function (num,content) {
                            result += "<br>";
                            result += "<div>";
                            result += "<span>" + content.name + "</span>";
                            result += "<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>";
                            result += "<a href='" + content.office + "'><span class='glyphicon glyphicon-globe' style='color: #969696;'>官网</span></a>";
                            result += "&nbsp;&nbsp;<span class='glyphicon glyphicon-earphone' style='color: #969696;'>" + content.phone + "</span>";
                            result += "</div>";
                            $("#myModalLabel").html(result);
                        })
                    }
                )

                $.post(
                    "/kuaidi/chaxun",
                    {
                        "orderNumber": $("#orderNumber").val(),
                        "type":$("#type").val()
                    }, function (data) {
                        var list = "";
                        $.each($.parseJSON(data), function (name, content) {
                            list += "<tr>";
                            list += "<td>";
                            list += content.k_time;
                            list += "&nbsp;</td>";
                            list += "<td>";
                            list += "&nbsp;<div><div style='color: #FF6600;'>&nbsp;&nbsp;|</div><div><span class='glyphicon glyphicon-ok-circle' style='color: #FF6600;'></span></div>" +
                                "<div style='color: #FF6600;'>&nbsp;&nbsp;|</div></div>";
                            list += "</td>";
                            list += "<td>&nbsp;";
                            list += content.k_context;
                            list += "</td>";
                            list += "</tr>";
                            $("#myTable").html(list);
                        })
                    }
                );
            });
        })
    </script>
    <%--<script>--%>
        <%--$(function () {--%>
            <%--$.post(--%>
                <%--"/kuaidi/showMine",--%>
                <%--function (data) {--%>
                    <%--var mapList = "";--%>
                    <%--$.each($.parseJSON(data), function (name, content) {--%>
                        <%--mapList += "<li>";--%>
                        <%--mapList += content.k_time + "-->" + "<a href='/kuaidi/chaxunGd2?orderNumber2=" + content.k_number + "'>"--%>
                            <%--+ content.k_context + "</a>" + "-->" + content.k_type;--%>
                        <%--mapList += "</li>";--%>
                        <%--$("#mineOne").html(mapList);--%>
                    <%--})--%>
                <%--})--%>
        <%--})--%>
    <%--</script>--%>
    <script>

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

<div style="width: 1349px; height: 600px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1;
background-size: cover; background: url(../statics/images/3.png) no-repeat 50% 50%;">
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

        <div style="position: absolute; top: 326px; left: 350px; width: 500px; height: 87px;" id="myOne">
            <table style="height:87px; width: 500px" cellpadding="0" cellspacing="0">
                <div style="color: white;width: 400px;text-align: left">
                    <tr>
                        <td width="10%" height="41px">
                            <select name="type" id="type" style="width: 100%;height: 41px">
                                <option value="zhongtong">中通
                                </option>
                                <option value="yunda">韵达</option>
                                <option value="yuantong">圆通</option>
                                <option value="huitongkuaidi">
                                    百世快递
                                </option>
                                <option value="shentong">申通</option>
                                <option value="wanxiangwuliu">
                                    万象物流
                                </option>
                                <option value="ems">EMS物流</option>
                            </select>
                        </td>
                        <td width="40%">
                            <input type="text" maxlength="100" style="height: 41px;width: 100%" name="orderNumber"
                                   id="orderNumber" placeholder="输入快递单号"/>
                        </td>
                        <td width="10%">
                            <div style="background-color:#1e50ae;height:41px;width: 100%;">
                                <center>
                                    <a href="javascript:void(0)" id="cli" >
                                        <span data-toggle="modal" data-target="#myModal">
                                        <span style="color: rgb(255, 255, 255);line-height:41px;font-size:30px;"
                                              class="glyphicon glyphicon-search"></span>
                                        </span>
                                    </a>
                                </center>
                            </div>
                        </td>
                    </tr>
                </div>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body" id="modal-body">
                <table id="myTable">

                </table>
            </div>
            <div class="modal-footer">
                <center><a href="javascript:void(0)"><div data-dismiss="modal" style="color: red;">关闭查询结果</div></a></center>
            </div>
        </div>
    </div>
</div>

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

</body>
</html>
