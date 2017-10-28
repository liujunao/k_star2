<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/5
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ include file="reCommon.jsp" %>
<html>
<head>
    <title>消息页面</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var message = "<%=request.getAttribute("message")%>";
        $(function () {
            $("#back").click(function () {
                window.history.back();
            })
        if (message != null && message != "null") {
            $('#myModal').modal("show");
        }
        })
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
background-size: cover; background: url(../statics/images/release.jpg) no-repeat 50% 50%;">
    <div style="position: absolute; top: 70px; left: 400px; width: 450px; height: 400px;">
        <div style="width: 600px;height: 500px;background-color: white">
            <center>
                <table>
                    <tr>
                        <td>
                            <div style="color: blue;font-weight: 700;font-size: 30px">发布任务</div>
                        </td>
                    </tr>
                </table>
            </center>
            <hr>
            <br><br>
            <center>
                <form action="${pageContext.request.contextPath}/kuaidi/release?save=no" method="post" role="form">
                    <div class="form-group">
                        <label for="k_reName" class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_reRealName" id="k_reName" class="form-control"
                                   value="<%=map.get("k_name")%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_rePhone" class="col-sm-3 control-label">手机号：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_rePhone" id="k_rePhone" class="form-control"
                                   value="<%=map.get("k_phone")%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_rePhone" class="col-sm-3 control-label">取件码：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_reCode" id="k_reCode" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="money" class="col-sm-3 control-label">默认赏金：</label>
                        <div class="col-sm-8">
                            <select name="k_reMoney" id="money" class="form-control">
                                <%
                                    Object money = map.get("k_money");
                                %>
                                <c:if test="${map.get('k_money') != null && map.get('k_money') != 'null'}">
                                    <option value="<%=map.get("k_money")%>"><%=map.get("k_money")%>元</option>
                                </c:if>
                                <option value="2" selected = "<c:if test="${map.get('k_money') == 2 }">selected</c:if>">2元</option>
                                <option value="3" selected = "<c:if test="${map.get('k_money') == 3 }">selected</c:if>">3元</option>
                                <option value="4" selected = "<c:if test="${map.get('k_money') == 4 }">selected</c:if>">4元</option>
                                <option value="5" selected = "<c:if test="${map.get('k_money') == 5 }">selected</c:if>">5元</option>
                                <option value="6" selected = "<c:if test="${map.get('k_money') == 6 }">selected</c:if>">6元</option>
                                <option value="7" selected = "<c:if test="${map.get('k_money') == 7 }">selected</c:if>">7元</option>
                                <option value="8" selected = "<c:if test="${map.get('k_money') == 8 }">selected</c:if>">8元</option>
                                <option value="9" selected = "<c:if test="${map.get('k_money') == 9 }">selected</c:if>">9元</option>
                                <option value="10" selected = "<c:if test="${map.get('k_money') == 10 }">selected</c:if>">10元</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reTime" class="col-sm-3 control-label">领取截至时间：</label>
                        <div class="col-sm-8">
                            <%
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                String date = simpleDateFormat.format(new Date());
                                String ymd = date.substring(0, 10);
                                String hm = date.substring(11, 16);
                                String minTime = ymd + "T" + hm;
                            %>
                            <input type="datetime-local" name="k_reTime" id="k_reTime" min="<%=minTime%>"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reAddress" class="col-sm-3 control-label">包裹放置地：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_reAddress" id="k_reAddress" class="form-control"
                                   value="<%=map.get("k_address")%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label">取件详细信息：</label>
                        <div class="col-sm-8" rows="3">
                            <input type="text" name="k_reText" id="k_reText" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-8" rows="3">
                            <input type="hidden" name="k_re_puTime" value="<%=date%>" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8" rows="3">
                            <input type="hidden" name="k_re_infoId" value="<%=map.get("k_id")%>" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8" rows="3">
                            <input type="hidden" name="k_infoName" value="<%=map.get("k_username")%>"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8" rows="3">
                            <input type="hidden" name="k_reStatus" value="0" class="form-control"/>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <input type="submit" value="确认发布" class="btn btn-primary"
                                   style="width:240px;height:30px;background-color: blue;color: white"/>
                        </div>
                    </div>
                </form>
            </center>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">任务信息</h4>
            </div>
            <div class="modal-body" id="modal-body">
                <form role="form">
                    <div class="form-group">
                        <label for="k_reName" class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${k_re.k_reRealName}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_rePhone" class="col-sm-3 control-label">手机号：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${k_re.k_rePhone}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_rePhone" class="col-sm-3 control-label">取件码：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${k_re.k_reCode}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reAddress" class="col-sm-3 control-label">默认赏金：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${k_re.k_reMoney}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label">领取截至时间：</label>
                        <div class="col-sm-8" rows="3">
                            <input type="text" class="form-control" value="${k_re.k_reTime}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reAddress" class="col-sm-3 control-label">包裹放置地：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" value="${k_re.k_reAddress}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="k_reText" class="col-sm-3 control-label">取件详细信息：</label>
                        <div class="col-sm-8" rows="3">
                            <input type="text" class="form-control" value="${k_re.k_reText}" readonly="readonly"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="javascript:void(0)" id="back">
                    <button type="button" class="btn btn-default">返回</button>
                </a>
                <a href="/kuaidi/release?save=yes">
                    <button type="button" class="btn btn-primary">确认</button>
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
