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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>消息页面</title>
    <script type="text/javascript" src="/statics/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" src="/statics/utf8-jsp/ueditor.all.js"></script>
    <script type="text/javascript" src="/statics/js/jquery-3.2.1.js"></script>

    <script type="text/javascript">
        $(function () {
            var fail = "<%=request.getAttribute("message")%>";
            if (fail != null && fail != "null") {
                if ($("#myFour").css("display") != "none") {
                    $("#myFour").hide();
                }
            }
            $("#back").click(function () {
                history.back();
            })
            $("#k_reNumber").blur(function () {
                    $.post(
                        "/kuaidi/releaseDetail",
                        {
                            "releaseNumber": $("#k_reNumber").val()
                        }, function (data) {
                            if (data == "1") {
                                alert("该快递单号已存在，请检查后重新输入！");
                                $("input[name=k_reNumber]").focus();
                            }
                        }
                    )
                }
            )
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

<%
    Map<String, Object> map = (Map<String, Object>) session.getAttribute("k_info");
%>

<div id="myFour">
    <form action="/kuaidi/release?save=no" method="post">
        <table>
            <tr>
                <td style="width: 100px">快递单号</td>
                <td><input type="text" name="k_reNumber" id="k_reNumber" width="50%"/></td>
                <td><em id="m_k_reNumber"></em></td>
            </tr>
            <tr>
                <td>取件人姓名</td>
                <td><input type="text" name="k_reName" id="k_reName" width="50%"/></td>
                <td><em id="m_k_reName"></em></td>
            </tr>
            <tr>
                <td>本人手机号码</td>
                <td><input type="text" name="k_rePhone" id="k_rePhone" width="50%"/></td>
                <td><em id="m_k_rePhone"></em></td>
            </tr>
            <tr>
                <td>领取截至时间</td>
                <td><input type="datetime-local" name="k_reTime" id="k_reTime" width="50%"/></td>
                <td><em id="m_k_reTime"></em></td>
            </tr>
            <tr>
                <td>取件详细信息</td>
                <td><textarea name="k_reText" id="k_reText" style="width: 70%"></textarea></td>
                <td><em id="m_k_reText"></em></td>
                <script>
                    var editor = UE.ui.Editor();
                    editor.render("k_reText");
                </script>
            </tr>
            <tr>
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String date = simpleDateFormat.format(new Date());
                %>
                <td><input type="hidden" name="k_re_puTime"value="<%=date%>"/></td>
            </tr>
            <tr>
                <td><input type="hidden" name="k_re_infoId" value="<%=map.get("k_id")%>"/></td>
            </tr>
            <tr>
                <td><input type="hidden" name="k_infoName" value="<%=map.get("k_username")%>"/></td>
            </tr>
            <tr>
                <td><input type="hidden" name="k_reStatus" value="0"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="提交"/></td>
            </tr>
        </table>
    </form>
</div>

<c:if test="${message != null}">
    <div id="show">
        <table>
            <tr>
                <td>快递单号</td>
                <td>${k_re.k_reNumber}</td>
            </tr>
            <tr>
                <td>取件人姓名</td>
                <td>${k_re.k_reName}</td>
            </tr>
            <tr>
                <td>本人手机号码</td>
                <td>${k_re.k_rePhone}</td>
            </tr>
            <tr>
                <td>任务发布时间</td>
                <td>${k_re.k_re_puTime}</td>
            </tr>
            <tr>
                <td>领取截至时间</td>
                <td>${k_re.k_reTime}</td>
            </tr>
            <tr>
                <td>取件详细信息</td>
                <td>${k_re.k_reText}</td>
            </tr>
            <tr>
                <td><a href="/kuaidi/release?save=yes">确认</a></td>
                <td><a href="javascript:void(0)" id="back">返回</a></td>
            </tr>
        </table>
    </div>
</c:if>

</body>
</html>
