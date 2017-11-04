<%@ taglib prefix="width" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="blue;color" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/9/27
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var msg = "<%=request.getAttribute("msg")%>";
        function mine() {
            if (msg != "null" && msg != null) {
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
        </ul>
    </div>
</nav>

<div style="width: 1349px; height: 600px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1;
background-size: cover; background: url(../statics/images/login.jpg) no-repeat 50% 50%;">
    <div style="position: absolute; top: 70px; left: 500px; width: 450px; height: 400px;">
        <div>
            <table>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/statics/images/1.png"></td>
                    <td>
                        <b>
                            <span style="font-size: 50px;color: rgb(255, 255, 255);">  -star</span>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <p>
                            <font color="#1e50ae">
                        <span style="font-size: 40px;">
                                <span style="color: rgb(100, 181, 246); font-size: 36px;font-weight: 800">
                                    <strong>&nbsp;一站式快递服务</strong>
                                </span>
                        </span>
                            </font>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 380px;height: 320px;background-color: white">
            <center>
                <table>
                    <tr>
                        <td>
                            <div style="color: blue;font-weight: 800;font-size: 30px">登录</div>
                        </td>
                    </tr>
                </table>
            </center>
            <hr>
            <form action="${pageContext.request.contextPath}/user/login" method="post" class="bs-example bs-example-form" role="form">
                <center>
                    <table>
                        <tr>
                            <td align="center">
                                <div class="input-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user" style="color: #969696;"></span>
                                </span>
                                    <input type="text" class="form-control" name="username" placeholder="账号名/邮箱"
                                           style="width: 240px;height: 40px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div class="input-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock" style="color: #969696;"></span>
                                </span>
                                    <input type="password" class="form-control" name="password" placeholder="登录密码"
                                           style="width: 240px;height: 40px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div class="input-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-heart" style="color: #969696;"></span>
                                    </span>
                                    <input type="text" class="form-control" name="validation" placeholder="请输入验证码"
                                           style="width: 240px;height: 40px;"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><br></td>
                        </tr>
                        <tr>
                            <td width="108" valign="middle" colspan="8" align="center">
                                <img src="${pageContext.request.contextPath}/user/validation" name="validate" border="0"
                                     onclick="this.src=this.src+'?'" style="width: 140px">
                            </td>
                        </tr>
                        <tr>
                            <td><br></td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" value="登录" class="btn btn-primary"
                                       style="width:240px;height:30px;background-color: blue;color: white"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="${pageContext.request.contextPath}/views/register.jsp">
                                    <font size="2" color="green">&nbsp;&lt;&lt;免费注册</font>
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/user/revisePassword?revise=page">
                                    <font size="2" color="red">忘记密码&gt;&gt;</font></a>
                            </td>
                        </tr>
                    </table>
                </center>
            </form>
        </div>
    </div>
</div>

</body>
</html>
