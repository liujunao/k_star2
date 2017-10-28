<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %><%--
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
    <title>我的</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
                        list += "<tr>";
                        list += "<td style='width: 60%'><a href='/kuaidi/messageDetail?type=mine&id=" + content.k_reId + "&status=" + content.k_reStatus + "'>" + content.k_reText + "</a></td>"
                             + "<td style='width: 10%'><a href='/kuaidi/messageDelete?id=" + content.k_reId + "'><span class='glyphicon glyphicon-trash'></span></a>"
                             + "<td style='width: 10%'>"+ status(content.k_reStatus) +"</td>"
                             + "<td style='width: 20%'>" + content.k_reTime + "</td>";
                        list += "</tr>";
                        $("#myPublish").html(list);
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
                        list += "<tr>";
                        list += "<td style='width: 60%'><a href='/kuaidi/messageDetail?type=other&id=" + content.k_me_reId + "&status=" + content.k_meStatus + "'>" + context + "</a></td>"
                            + "<td style='width: 15%'><a href='/kuaidi/chat?k_id=" + k_id + "'>" + name + "</a><td>"
                            + "<td style='width: 15%'>" + status(content.k_meStatus) + "</td>";
                        list += "</tr>";
                        $("#myInform").html(list);
                    })
                }
            )
            $.post(
                "/kuaidi/showMine",
                function (data) {
                    var mapList = "";
                    $.each($.parseJSON(data), function (name, content) {
                        mapList += "<tr>";
                        mapList += "<td style='width: 60%'><a href='/kuaidi/chaxunGd2?number=" + content.k_number + "'>" + content.k_context + "</a></td>"
                            + "<td style='width: 10%'><a href='/kuaidi/deleteGd2?number=" + content.k_number + "'><span class='glyphicon glyphicon-trash'></span></a></td>"
                            + "<td style='width: 10%'>" + content.k_type + "</td>"
                            + "<td style='width: 20%'>" + content.k_time + "</td>";
                        mapList += "</tr>";
                        $("#myQuery").html(mapList);
                    })
                }
            )
            $("#publish").click(function () {
                if ($("#publish").css("class") != "active") {
                    $("#publish").addClass("active");
                    $("#inform").removeClass("active");
                    $("#query").removeClass("active");
                }
                $("#listPublish").show();
                if ($("#listInform").css("display") != "none") {
                    $("#listInform").hide();
                }
                if ($("#listQuery").css("display") != "none") {
                    $("#listQuery").hide();
                }
            })
            $("#inform").click(function () {
                if ($("#inform").css("class") != "active") {
                    $("#inform").addClass("active");
                    $("#publish").removeClass("active");
                    $("#query").removeClass("active");
                }
                $("#listInform").show();
                if ($("#listPublish").css("display") != "none") {
                    $("#listPublish").hide();
                }
                if ($("#listQuery").css("display") != "none") {
                    $("#listQuery").hide();
                }
            })
            $("#query").click(function () {
                if ($("#query").css("class") != "active") {
                    $("#query").addClass("active");
                    $("#inform").removeClass("active");
                    $("#publish").removeClass("active");
                }
                $("#listQuery").show();
                if ($("#listInform").css("display") != "none") {
                    $("#listInform").hide();
                }
                if ($("#listPublish").css("display") != "none") {
                    $("#listPublish").hide();
                }
            })

            var status_m = "<%=request.getAttribute("status_m")%>";
            if (status_m == 2) {
                $("#a_status").html("已完成");
                $("#a_status").click(function () {
                    alert("该任务已完成！");
                })
            } else if (status_m == 3) {
                $("#a_status").html("任务已过期");
                $("#a_status").click(function () {
                    alert("该任务已过期！");
                })
            }
            var status_o = "<%=request.getAttribute("status_o")%>";
            if (status_o == 2) {
                $("#a_status1").html("已完成");
                $("#a_status1").click(function () {
                    alert("该任务已完成！");
                });
                $("#a_status2").html("已完成");
                $("#a_status2").click(function () {
                    alert("该任务已完成！");
                });
            }
        })
        var msg = "<%=request.getAttribute("msg")%>";
        window.onload = mine(msg);
    </script>

    <script>
        var mapDetail = "<%=request.getAttribute("mapDetail")%>";
        var moType = "<%=request.getAttribute("moType")%>";
        var gd2List = "<%=request.getAttribute("gd2List")%>";

        $(function () {
            if (mapDetail != null && mapDetail != "null") {
                if (moType == "myMine") {
                    $("#myModalPublish").modal("show");
                }
                if (moType == "myOther") {
                    $("#myModalInform").modal("show");
                }
            }
            if (gd2List != null && gd2List != "null"){
                $("#myModalQuery").modal("show");
            }
        })
    </script>
</head>
<body>

<hr>
<br>
<center>
    <div style="width: 80%;text-align: center">
        <div>
            <center>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th id="publish" class="active">我的发布</th>
                        <th id="inform">通知消息</th>
                        <th id="query">查询记录</th>
                    </tr>
                    </thead>
                </table>
            </center>
        </div>
        <br>
        <div id="listPublish" style="width: 80%;text-align: center">
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 60%">标题</th>
                    <th style="width: 10%">删除</th>
                    <th style="width: 10%">领取状态</th>
                    <th style="width: 20%">截至时间</th>
                </tr>
                </thead>
                <tbody id="myPublish">

                </tbody>
            </table>
        </div>

        <div id="listInform" style="width: 80%;text-align: center;display: none">
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 60%">消息</th>
                    <th style="width: 15%">楼主</th>
                    <th style="width: 15%">领取状态</th>
                </tr>
                </thead>
                <tbody id="myInform">

                </tbody>
            </table>
        </div>

        <div id="listQuery" style="width: 80%;text-align: center;display: none">
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 60%">消息</th>
                    <th style="width: 10%">删除</th>
                    <th style="width: 10%">快递公司</th>
                    <th style="width: 20%">时间</th>
                </tr>
                </thead>
                <tbody id="myQuery">

                </tbody>
            </table>
        </div>
    </div>
</center>

<div class="modal fade" id="myModalPublish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelPublish">详细信息</h4>
            </div>
            <div class="modal-body">
                <form role="form">
                    <div class="form-group">
                        <label for="k_reName" class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="k_reName" value="${mapDetail.k_reRealName}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_rePhone" class="col-sm-3 control-label">手机号：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="k_rePhone" value="${mapDetail.k_rePhone}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reCode" class="col-sm-3 control-label">取件码：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="k_reCode" value="${mapDetail.k_reCode}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reAddress" class="col-sm-3 control-label">默认赏金：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="k_reAddress" value="${mapDetail.k_reMoney}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label">领取截至时间：</label>
                        <div class="col-sm-8" rows="3">
                            <input type="text" class="form-control" id="k_reText" value="${mapDetail.k_reTime}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reAddress" class="col-sm-3 control-label">包裹放置地：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${mapDetail.k_reAddress}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label">取件详细信息：</label>
                        <div class="col-sm-8" rows="3">
                            <input type="text" class="form-control" value="${mapDetail.k_reText}" readonly="readonly"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="/views/message.jsp">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </a>
                <a href="/kuaidi/messageDone?id=${mapDetail.k_me_reId}&k_infoId=${mapDetail.k_me_otherId}&type=accept"
                   id="a_status">
                    <button type="button" class="btn btn-primary">确认</button>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalInform" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelInform">详细信息</h4>
            </div>
            <div class="modal-body">
                <form role="form">
                    <div class="form-group">
                        <label for="k_reName" class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${mapDetail.k_meRealName}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_rePhone" class="col-sm-3 control-label">手机号：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${mapDetail.k_mePhone}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_rePhone" class="col-sm-3 control-label">取件码：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${mapDetail.k_meCode}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reAddress" class="col-sm-3 control-label">默认赏金：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${mapDetail.k_meMoney}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label">领取截至时间：</label>
                        <div class="col-sm-8" rows="3">
                            <input type="text" class="form-control" value="${mapDetail.k_meTime}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reAddress" class="col-sm-3 control-label">包裹放置地：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${mapDetail.k_meAddress}"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label">取件详细信息：</label>
                        <div class="col-sm-8" rows="3">
                            <input type="text" class="form-control" value="${mapDetail.k_meText}" readonly="readonly"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <c:if test="${mapDetail.k_me_myId eq id }">
                    <a href="/kuaidi/messageDone?id=${mapDetail.k_me_reId}&k_infoId=${mapDetail.k_me_otherId}&type=release&kind=other"
                       id="a_status1">
                        <button type="button" class="btn btn-primary">确认</button>
                    </a>
                </c:if>
                <c:if test="${mapDetail.k_me_otherId eq id }">
                    <a href="/kuaidi/messageDone?id=${mapDetail.k_me_reId}&k_infoId=${mapDetail.k_me_myId}&type=release&kind=mine"
                       id="a_status2">
                        <button type="button" class="btn btn-primary">确认</button>
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalQuery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelQuery">详细信息</h4>
            </div>
            <div class="modal-body">
                <table>
                    <c:if test="${gd2List != null}">
                        <%
                            List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("gd2List");
                            if (list != null) {
                        %>
                            <%
                                for (int i = 0; i < list.size(); i++) {
                                    Map<String, Object> mapList =  list.get(i);
                            %>
                        <tr>
                        <td><%=mapList.get("k_time")%>&nbsp;</td>
                            <td>&nbsp;
                                <div>
                                    <div style='color: #FF6600;'>&nbsp;&nbsp;|</div>
                                    <div>
                                        <span class='glyphicon glyphicon-ok-circle' style='color: #FF6600;'></span>
                                    </div>
                                    <div style='color: #FF6600;'>&nbsp;&nbsp;|</div>
                                </div>
                            </td>
                            <td>&nbsp;<%=mapList.get("k_context")%></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </c:if>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>
