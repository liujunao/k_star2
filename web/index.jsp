<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>k_star快递查询服务</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">--%>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--<script src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>--%>

    <script src="${pageContext.request.contextPath}/statics/js/alertCommon.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#cli").click(function () {
                $.post(
                    "${pageContext.request.contextPath}/kuaidi/chaxunTitle",
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
                    "${pageContext.request.contextPath}/kuaidi/chaxunNo",
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
                $("#myModalIn").modal("show");
            });
        })
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
                    <img src="${pageContext.request.contextPath}/statics/images/1.png" height="55" width="50">
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

            <li><a href="${pageContext.request.contextPath}/views/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            <li><a href="${pageContext.request.contextPath}/views/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </ul>
    </div>
</nav>

<div style="width: 1349px; height: 600px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1;
background-size: cover; background: url(${pageContext.request.contextPath}/statics/images/3.png) no-repeat 50% 50%;">
    <div style="text-align: left;">
        <div style="position: absolute; top: 148px; left: 450px; width: 476px; height: 158px;">
            <div>
                <table>
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/statics/images/1.png"></td>
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

        <div style="position: absolute; top: 326px; left: 370px; width: 500px; height: 87px;" id="myOne">
            <table style="height:87px; width: 500px" cellpadding="0" cellspacing="0">
                <div style="color: white;width: 400px;text-align: left">
                    <tr>
                        <td width="10%" height="41px">
                            <select name="type" id="type" style="width: 100%;height: 41px">
                                <option value="zhongtong">中通</option>
                                <option value="yunda">韵达</option>
                                <option value="yuantong">圆通</option>
                                <option value="huitongkuaidi">百世快递</option>
                                <option value="shentong">申通</option>
                                <option value="wanxiangwuliu">万象物流</option>
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

<div class="modal fade" id="myModalIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</body>
</html>
