<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/3
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="reCommon.jsp" %>
<html>
<head>
    <title>找回密码</title>

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>

    <script>
        function CheckNewPassword() {
            var password = document.getElementById("password").value;
            if (password.length < 6 || password.length > 18) {
                document.getElementById("m_password").innerHTML = "<font color='red'>密码长度为6-18位</font>";
                return;
            }
            var regular = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{6,18}$/;
            if (!password.match(regular)) {
                document.getElementById("m_password").innerHTML = "<font color='red'>密码只能且必须包含字母和数字</font>";
                return;
            }
            document.getElementById("m_password").innerHTML = "<font color='green'>√</font>";
            return true;
        }

        function CheckNewPassword2() {
            var password2 = document.getElementById("password2").value;
            if (password2 != document.getElementById("password").value) {
                document.getElementById("password2").value = "";
                document.getElementById("m_password2").innerHTML = "<font color='red'>密码前后不一致</font>";
                return;
            }
            document.getElementById("m_password2").innerHTML = "<font color='green'>√</font>";
            return true;
        }
    </script>

    <script>
        $(function () {
            $("#loginName").blur(function () {
                $.post("/user/validateUserName?dt=" + new Date(),
                    {
                        loginName: $(this).val()
                    }, function (data) {
                        if (data == "0") {
                            alert("您输入的用户名不存在，请重新输入");
                            $(this).focus();
                        }
                    }
                )
            })
            $("#email").blur(function () {
                $.post("/user/validateUserName?dt=" + new Date(),
                    {
                        emailName: $(this).val()
                    }, function (data) {
                        if (data == "0") {
                            alert("您输入的邮箱不存在，请重新输入");
                            $(this).focus();
                        }
                    }
                )
            })
        })
    </script>

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

<br>
<hr>
<br>
<center>
    <div style="width: 600px;height: 300px;background-color: #DDDDDD;">
        <table>
            <tr>
                <td style="text-align: left;">
                    <div style="color: black;font-weight: 500;font-size: 30px" class='glyphicon glyphicon-lock'></div>
                </td>
                <td style="text-align: center;font-size: 30px;">
                    <div>密码修改</div>
                </td>
            </tr>
        </table>
        <hr>
        <br>
        <center>
            <c:if test="${requestScope.revise == 'first'}">
                <form action="${pageContext.request.contextPath}/user/revisePassword?revise=count" method="post"
                      class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="loginName" class="col-sm-3 control-label">登录账号：</label>
                        <div class="col-sm-8">
                            <input type="text" name="loginName" id="loginName" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="validationCount" class="col-sm-3 control-label">验证码：</label>
                        <div class="col-sm-8">
                            <input type="text" name="validation" id="validationCount" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <center>
                                <img src="${pageContext.request.contextPath}/user/validation" name="validate" onclick="this.src=this.src+'?'">
                            </center>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <input type="submit" value="下一步" class="btn btn-primary"
                                   style="width:240px;height:30px;background-color: #FF3333;color: white"/>
                        </div>
                    </div>
                </form>
            </c:if>
        </center>

        <center>
            <c:if test="${requestScope.revise == 'email'}">
                <form action="${pageContext.request.contextPath}/user/revisePassword?revise=validateCode" method="post"
                      class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">邮箱：</label>
                        <div class="col-sm-8">
                            <input type="text" name="emailName" id="email" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="validationEmail" class="col-sm-3 control-label">验证码：</label>
                        <div class="col-sm-8">
                            <input type="text" name="validation" id="validationEmail" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <center>
                                <img src="${pageContext.request.contextPath}/user/validation" name="validate" onclick="this.src=this.src+'?'">
                            </center>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <input type="submit" value="下一步" class="btn btn-primary"
                                   style="width:240px;height:30px;background-color: #FF3333;color: white"/>
                        </div>
                    </div>
                </form>
            </c:if>
        </center>

        <center>
            <c:if test="${requestScope.revise == 'newPassword'}">
                <form action="${pageContext.request.contextPath}/user/revisePassword?revise=password" method="post"
                      class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">新密码：</label>
                        <div class="col-sm-8">
                            <input type="password" name="password" id="password" onblur="CheckNewPassword()"
                                   class="form-control"/>
                            <em id="m_password"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password2" class="col-sm-3 control-label">确认密码：</label>
                        <div class="col-sm-8">
                            <input type="password" name="password2" id="password2" onblur="CheckNewPassword2()"/>
                            <em id="m_password2"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="validationPassword" class="col-sm-3 control-label">验证码：</label>
                        <div class="col-sm-8">
                            <input type="text" name="validation" id="validationPassword" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <center>
                                <img src="${pageContext.request.contextPath}/user/validation" name="validate" onclick="this.src=this.src+'?'">
                            </center>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <input type="submit" value="下一步" class="btn btn-primary"
                                   style="width:240px;height:30px;background-color: #FF3333;color: white"/>
                        </div>
                    </div>
                </form>
            </c:if>
        </center>
    </div>
</center>
</body>
</html>
