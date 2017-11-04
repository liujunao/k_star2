<%@ page import="java.util.Map" %>
<%--
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
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>

    <%
        Map<String, Object> map1 = (Map<String, Object>) session.getAttribute("k_info");
    %>
    <script>
        $(function () {
            $("[data-toggle='popover']").popover();

            $("#ti").click(function () {
                $("#ti").addClass("active");
                $("#pu").removeClass("active");
                $("#fo").removeClass("active");
                $("#my").removeClass("active");
            })
            $("#pu").click(function () {
                $("#pu").addClass("active");
                $("#ti").removeClass("active");
                $("#fo").removeClass("active");
                $("#my").removeClass("active");
            })
            $("#fo").click(function () {
                $("#fo").addClass("active");
                $("#pu").removeClass("active");
                $("#ti").removeClass("active");
                $("#my").removeClass("active");
            })
            $("#my").click(function () {
                $("#my").addClass("active");
                $("#pu").removeClass("active");
                $("#fo").removeClass("active");
                $("#ti").removeClass("active");
            })

            $.post(
                "/k_star2_war/kuaidi/lookAppraise",
                {
                    "id": "<%=map1.get("k_id")%>"
                }, function (data) {
                    if (data != null && data != "null") {
                        $("#appraise").html(data);
                    }
                }
            )
            $("#appraiseDetail").click(function () {
                $.post(
                    "/k_star2_war/kuaidi/detailAppraise",
                    {
                        "id": "<%=map1.get("k_id")%>"
                    }, function (data) {
                        $.each($.parseJSON(data), function (num, content) {
                            var list = "";
                            list += "<table>"
                            list += "<tr>";
                            list += "<td>取货速度/负责态度:";
                            list += "&nbsp;</td>";
                            list += "<td>";
                            list += appraise(content.k_apGrade1);
                            list += "</td>";
                            list += "</tr>";

                            list += "<tr>";
                            list += "<td>沟通态度:";
                            list += "&nbsp;</td>";
                            list += "<td>";
                            list += appraise(content.k_apGrade2);
                            list += "</td>";
                            list += "</tr>";

                            list += "<tr>";
                            list += "<td>诚信度:";
                            list += "&nbsp;</td>";
                            list += "<td>";
                            list += appraise(content.k_apGrade3);
                            list += "</td>";
                            list += "</tr>";
                            list += "<tr>";

                            list += "<td>综合评价:";
                            list += "&nbsp;</td>";
                            list += "<td>";
                            list += content.k_apText;
                            list += "</td>";
                            list += "</tr>";
                            list += "</table>";
                            list += "<br>";
                            $("#modal-body").html(list);
                        })
                    }
                )
                $("#myModalre").modal("show");
            })
        });
    </script>

    <script>
        function appraise(num) {
            if (num == 0) {
                return "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>";
            }
            if (num == 1) {
                return "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>";
            }
            if (num == 2) {
                return "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>";
            }
            if (num == 3) {
                return "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>";
            }
            if (num == 4) {
                return "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star.png'>";
            }
            if (num == 5) {
                return "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>" +
                    "<img src='/k_star2_war/statics/images/star_red.png'>";
            }
        }
    </script>
</head>
<body>


<%
    Map<String, Object> map = (Map<String, Object>) session.getAttribute("k_info");
%>
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
            <li class="active" id="ti"><a href="${pageContext.request.contextPath}/views/index.jsp"> 首页</a></li>
            <li id="pu"><a href="${pageContext.request.contextPath}/views/release.jsp"> 发布任务</a></li>
            <li id="fo"><a href="${pageContext.request.contextPath}/views/forum.jsp"> 帮取快递</a></li>
            <li id="my"><a href="${pageContext.request.contextPath}/views/message.jsp"> 我的</a></li>
            <li><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                <span class="glyphicon glyphicon-user"></span>
            </a>
                <div class="dropdown-menu">
                    <dl>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<img src='${pageContext.request.contextPath}/statics/images/info.png'
                                                   style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;"><%=map.get("k_username")%></span>
                        </dt>
                        <dt><br></dt>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<img src='${pageContext.request.contextPath}/statics/images/qq.png'
                                                   style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;"><%=map.get("k_qq")%></span>
                        </dt>
                        <dt><br></dt>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<img src='${pageContext.request.contextPath}/statics/images/weChat.png'
                                                   style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;"><%=map.get("k_weChat")%></span>
                        </dt>
                        <dt><br></dt>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<img src='${pageContext.request.contextPath}/statics/images/phone.png'
                                                   style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;"><%=map.get("k_phone")%></span>
                        </dt>
                        <dt><br></dt>
                        <dt>
                            &nbsp;&nbsp;&nbsp;<a href="#" id="appraiseDetail"> <img src='${pageContext.request.contextPath}/statics/images/timg.jpg'
                                                                                    style="width: 20px;height: 20px;color: #C0C0C0;">&nbsp;&nbsp;&nbsp;
                            <span style="font-weight: 400;" id="appraise"></span></a>
                        </dt>
                        <dt><br></dt>
                        <dt>&nbsp;&nbsp;&nbsp;
                            <a href='${pageContext.request.contextPath}/views/supplement.jsp'>
                                <span class='glyphicon glyphicon-edit'
                                      style='color: #808080;width: 20px;height: 20px;font-weight: 400;text-align: left'></span>
                            </a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href='${pageContext.request.contextPath}/user/revisePassword?revise=page&action=null'>
                                <span class='glyphicon glyphicon-asterisk'
                                      style='color: #808080;width: 20px;height: 20px;font-weight: 400;text-align: left'></span>
                            </a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/user/logout">
                                <span class='glyphicon glyphicon-log-out'
                                      style='color: #808080;width: 20px;height: 20px;font-weight: 400;text-align: right'></span>
                            </a>
                        </dt>
                    </dl>
                </div>
            </li>
        </ul>
    </div>
</nav>

<div class="modal fade" id="myModalre" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <center>
                    <h4 class="modal-title" id="myModalLabel">历史评价</h4>
                </center>
            </div>
            <div class="modal-body" id="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
