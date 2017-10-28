<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/6
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="reCommon.jsp" %>
<html>
<head>
    <title>帮忙取快递</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="/statics/js/alertCommon.js"></script>
    <script type="text/javascript">
        $(function () {
            $.post(
                "/kuaidi/forumAll",
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data), function (num, content) {
                        list += "<tr>";
                        list += "<td style='width: 60%'><a href='/kuaidi/forumDetail?id=" + content.k_reId + "'>" + content.k_reText + "</a></td>" +
                            "<td style='width: 10%'>" + content.k_reMoney + "元</td>" +
                            "<td style='width: 10%'>" + status(content.k_reStatus) + "</td>" +
                            "<td style='width: 20%'>" + content.k_reTime + "</td>";
                        list += "</tr>";
                        $("#mineThree").html(list);
                    })
                }
            )

            var mapDetail = "<%=request.getAttribute("mapDetail")%>";
            if (mapDetail != null && mapDetail != "nnull"){
                $("#myModal").modal("show");
            }

            var mapDetail = "<%=request.getAttribute("mapDetail")%>";
            if (mapDetail != null && mapDetail != "null") {
                var st = $("#status").val();
                if (st == 1) {
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("该快递已被领取！");
                    })
                }
                if (st == 2) {
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("该快递任务已被接受！");
                    })
                }
                if (st == 3) {
                    $("#a_status").html("领取任务");
                    $("#a_status").click(function () {
                        alert("截至时间已过，该任务失效");
                    })
                }
            }
            var infoId = "<%=map.get("k_id")%>";
            if ($("#infoId") == infoId) {
                $("#a_status").html("领取任务");
                $("#a_status").click(function () {
                    alert("您不能领取自己发布的任务！");
                })
            }
        })
        var msg = "<%=request.getAttribute("msg")%>";
        window.onload = mine(msg);

    </script>
</head>
<body>
<hr>
<br>
<center>
    <div id="myThree" style="width: 80%;text-align: center">
        <table class="table">
            <thead>
            <tr>
                <th style="width: 60%">标题</th>
                <th style="width: 10%">赏金</th>
                <th style="width: 10%">领取状态</th>
                <th style="width: 20%">截至时间</th>
            </tr>
            </thead>
            <tbody id="mineThree">

            </tbody>
        </table>
    </div>
</center>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label"></label>
                        <div class="col-sm-8" rows="3">
                            <input class="form-control"type="hidden" value="${mapDetail.k_reStatus }" id="status"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label"></label>
                        <div class="col-sm-8" rows="3">
                            <input class="form-control" type="hidden" value="${mapDetail.k_re_infoId }" id="infoId"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="/views/message.jsp">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </a>
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String date = simpleDateFormat.format(new Date());
                %>
                <a href="/kuaidi/forumTask?k_reStatus=2&k_reId=${mapDetail.k_reId }&username=${mapDetail.k_infoName}&meTime=<%=date%>"
                   id="a_status">
                    <button type="button" class="btn btn-primary">领取任务</button>
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
