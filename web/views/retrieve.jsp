<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/3
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>找回密码</title>
    <script src="/statics/js/jquery-3.2.1.js"></script>

    <script>

        function CheckNewPassword() {
            var password = document.getElementById("password").value;
            if (password.length < 6 || password.length > 18){
                document.getElementById("m_password").innerHTML = "<font color='red'>密码长度为6-18位</font>";
                return;
            }
            var regular = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{6,18}$/;
            if (!password.match(regular)){
                document.getElementById("m_password").innerHTML = "<font color='red'>密码只能且必须包含字母和数字</font>";
                return;
            }
            document.getElementById("m_password").innerHTML = "<font color='green'>√</font>";
            return true;
        }

        function CheckNewPassword2() {
            var password2 = document.getElementById("password2").value;
            if (password2 != document.getElementById("password").value){
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
                $.post("/user/validateUserName?dt=" + new Date() ,
                    {
                        loginName:$(this).val()
                    },function (data) {
                        if (data == "0"){
                            alert("您输入的用户名不存在，请重新输入");
                            $(this).focus();
                        }
                    }
                )
            })
            $("#email").blur(function () {
                $.post("/user/validateUserName?dt=" + new Date(),
                    {
                        emailName:$(this).val()
                    },function (data) {
                        if (data == "0"){
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
            if (msg != null && msg != "null"){
                alert(msg);
            }
        }
        window.onload = mine;
    </script>
</head>
<body>

    <c:if test="${requestScope.revise == 'first'}">
        <form action="/user/revisePassword?revise=count" method="post">
            登录账号：<input type="text" name="loginName" id="loginName"/>
            验证码：<img src="/user/validation" name="validate" onclick="this.src=this.src+'?'">
                    <input type="text" name="validation" id="validationCount"/>
            <input type="submit" value="提交"/>
        </form>
    </c:if>

    <c:if test="${requestScope.revise == 'email'}">
        <form action="/user/revisePassword?revise=validateCode" method="post">
            邮箱：<input type="text" name="emailName" id="email"/>
            验证码：<img src="/user/validation" name="validate" onclick="this.src=this.src+'?'">
            <input type="text" name="validation" id="validationEmail"/>
            <input type="submit" value="提交"/>
        </form>
    </c:if>

    <c:if test="${requestScope.revise == 'newPassword'}">
        <form action="/user/revisePassword?revise=password" method="post">
            新密码：<input type="password" name="password" id="password" onblur="CheckNewPassword()"/><em id="m_password"></em>
            确认密码：<input type="password" name="password2" id="password2" onblur="CheckNewPassword2()"/><em id="m_password2"></em>
            验证码：<img src="/user/validation" name="validate" onclick="this.src=this.src+'?'">
            <input type="text" name="validation" id="validationPassword"/>
            <input type="submit" value="提交"/>
        </form>
    </c:if>

</body>
</html>
