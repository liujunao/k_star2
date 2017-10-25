<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/9/26
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>k_star快递查询服务</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>
</head>
<body>

<html>
<head>
    <title>title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<a href="/views/index.jsp">index</a>
<div>
    <nav class="navbar navbar-collapse" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <img src="statics/images/1.png" height="55" width="50">
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
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
        </div>
    </nav>

    <div style="width: 1349px; height: 540px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1;
background-size: cover; background: url(/statics/images/3.png) no-repeat 50% 50%;">
        <div style="text-align: left;">
            <div style="position: absolute; top: 148px; left: 434px; width: 476px; height: 158px;">
                <div>
                    <table>
                        <tr>
                            <td><img src="statics/images/1.png"></td>
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

            <div style="position: absolute; top: 326px; left: 400px; width: 500px; height: 87px;">
                <table style="height:87px; width: 500px" cellpadding="0" cellspacing="0">
                    <div style="color: white;width: 350px;text-align: left">
                        <tr>
                            <td width="40%">
                                <input type="text" maxlength="100" style="height: 41px;width: 100%"
                                       placeholder="输入快递单号"/>
                            </td>
                            <td width="10%">
                                <div style="background-color:#1e50ae;height:41px;width: 100%;" href="">
                                    <center><span class="glyphicon glyphicon-search" style="color: rgb(255, 255, 255);line-height:41px;font-size:30px;"></span></center>
                                </div>
                            </td>
                        </tr>

                    </div>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
