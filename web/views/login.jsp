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
<center>
    <div>
        <h1>欢迎登录</h1>
        <form action="/user/login" method="post">
            <table>
                <tr>
                    <td colspan="2"><input type="text" name="username" placeholder="请输入账号名/邮箱"
                                           style="width: 150px;height: 25px;"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="password" name="password" placeholder="请输入登录密码"/></td>
                </tr>
                <tr>
                    <td width="108" valign="middle" colspan="8" align="center">
                        <img src="/user/validation" name="validate" border="0" onclick="this.src=this.src+'?'">
                        <input type="text" name="validation" placeholder="请输入验证码"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center"><input type="submit" name="登录"
                                                          style="width:130px;height:30px;background-color: blue;color: white"/>
                    </td>
                </tr>
            </table>
        </form>
        <a href="${pageContext.request.contextPath}/views/register.jsp"><font size="2"
                                                                              color="green"><i>没有账号？点击注册</i></font> </a>
        <a href="/user/revisePassword?revise=page"><font size="2" color="red"><i>忘记密码</i></font> </a>
    </div>
</center>

</body>
</html>
