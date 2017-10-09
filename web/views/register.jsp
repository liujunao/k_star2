<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/9/27
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>

    <script src="/statics/js/jquery-3.2.1.js"></script>

    <script>

        function CheckString(string) {
            if (string.indexOf(" ") > -1) {
                return true;
            }
        }

        function CheckPassword() {
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

        function CheckPassword2() {
            var password2 = document.getElementById("password2").value;
            if (password2 != document.getElementById("password").value) {
                document.getElementById("password2").value = "";
                document.getElementById("m_password2").innerHTML = "<font color='red'>密码前后不一致</font>";
                return;
            }
            document.getElementById("m_password2").innerHTML = "<font color='green'>√</font>";
            return true;
        }

        function CheckEmail() {
            var email = document.getElementById("email").value;
            var regular = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if (!email.match(regular)) {
                document.getElementById("m_email").innerHTML = "邮箱格式有误！";
                return;
            }
            document.getElementById("m_email").innerHTML = "<font color='green'>√</font>";
            return true;
        }


    </script>

    <script type="text/javascript">

        $(function () {
            $("#username").blur(function () {
                $.post("/user/validateUserName?dt=" + new Date(),
                    {
                        "k_username": $("#username").val()
                    }, function (data) {
                        if (data == "1") {
                            alert("该用户名已存在，请重新输入！");
                            $("input[name=k_username]").focus();
                        }else if (data == "0"){
                            function CheckUserName() {
                                var username = document.getElementById("username").value;
                                if (CheckString("username")) {
                                    document.getElementById("m_username").innerHTML = "<font color='red'>用户名不能包含空格</font>";
                                    return;
                                }
                                if (username == "") {
                                    document.getElementById("m_username").innerHTML = "<font color='red'>用户名不能为空</font>";
                                    return;
                                }
                                if (username.length < 4 || username.length > 20) {
                                    document.getElementById("m_username").innerHTML = "<font color='red'>用户名必须为4-18个字符</font>";
                                    return;
                                }
                                document.getElementById("username").value = username;
                                document.getElementById("m_username").innerHTML = "<font color='green'>√</font>";
                                return true;
                            }
                        }
                    }
                )
            })
        })

    </script>

    <script type="text/javascript">
        function mine() {
            var msg = "<%=request.getAttribute("msg")%>";
            if (msg != null && msg != "null"){
                alert(msg);
            }
        }
        window.onload = mine;
    </script>
</head>
<body>

<center>
    <div>
        <h1>新用户注册</h1>
        <form action="${pageContext.request.contextPath}/user/register?action=register" method="post">
            <table>
                <tr>
                    <td colspan="2">
                        <input type="text" name="k_username" id="username" placeholder="请输入登录用户名,必填"
                               onblur="CheckUserName()"/>
                        <em id="m_username"><font color="red">(4-20个字符)</font></em>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="password" name="k_password" id="password" placeholder="请输入密码，必填"
                               onblur="CheckPassword()"/>
                        <em id="m_password"></em>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="password" name="k_password2" id="password2" placeholder="请确认密码，必填"
                               onblur="CheckPassword2()"/>
                        <em id="m_password2"></em>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" name="k_phone" id="phone" placeholder="请输入联系电话，选填"/>
                        <em id="m_phone"></em>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="email" name="k_email" id="email" placeholder="请输入电子邮箱，必填" onblur="CheckEmail()"/>
                        <em id="m_email"></em>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" name="k_qq" id="qq" placeholder="请输入QQ号码，选填"/>
                        <em id="m_qq"></em>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" name="k_weChat" id="weChat" placeholder="请输入微信号，选填"/>
                        <em id="m_weChat"></em>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input name="k_gender" type="radio" value="1" id="femail"/>
                        <label for="femail">男</label>
                    </td>
                    <td colspan="2">
                        <input name="k_gender" type="radio" value="0" id="mail"/>
                        <label for="mail">女</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <%
                            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            Date date = simpleDateFormat.parse(simpleDateFormat.format(new Date()));
                        %>
                        <input type="hidden" name="k_registerTime" value="<%=date%>"/>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="注册"/></td>
                </tr>
            </table>
        </form>
        <a href="/views/login.jsp"><font color="green" size="2"><i>已有账号？现在登录</i></font></a>
    </div>
</center>
</body>
</html>
