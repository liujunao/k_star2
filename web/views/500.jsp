<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/30
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>服务器错误</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>

<div style="top: 50%">
    <center>
        <div style="height: 45%;">
            <div style="text-align: left;">
                <div style="position: absolute; top: 148px; left: 434px; width: 476px; height: 158px;">
                    <div>
                        <table>
                            <tr>
                                <td><img src="../statics/images/1.png"></td>
                                <td>
                                    <b>
                                        <span style="font-size: 84px;color: deepskyblue;">  -star</span>
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
            </div>
        </div>
        <br>
        <div>
            <h1>服务器响应错误</h1>
        </div>
        <br>
        <div>
            <a href="#" onclick="javascript:history.back();"><button class="btn btn-primary">返回上一页面</button></a>
            <a href="${pageContext.request.contextPath}/index.jsp"><button class="btn btn-primary">返回首页面</button></a>
        </div>
    </center>
</div>

</body>
</html>
