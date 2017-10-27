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
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="/statics/js/jquery-3.2.1.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
            return true;
        }

        function CheckPassword2() {
            var password2 = document.getElementById("password2").value;
            if (password2 != document.getElementById("password").value) {
                document.getElementById("password2").value = "";
                document.getElementById("m_password2").innerHTML = "<font color='red'>密码前后不一致</font>";
                return;
            }
            return true;
        }

        function CheckEmail() {
            var email = document.getElementById("email").value;
            var regular = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if (!email.match(regular)) {
                document.getElementById("m_email").innerHTML = "邮箱格式有误！";
                return;
            }
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
                        } else if (data == "0") {
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
            if (msg != null && msg != "null") {
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
                    <img src="../statics/images/1.png" height="55" width="50">
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
            <li><a href="/views/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </ul>
    </div>
</nav>

<div style="width: 1349px; height: 1200px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1;
background-size: cover; background: url(../statics/images/register.jpg) no-repeat;">
    <div style="position: absolute; top: 70px; left: 400px; width: 450px; height: 400px;">
        <center>
            <div>
                <table>
                    <tr>
                        <td><img src="../statics/images/1.png"></td>
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
        </center>
        <div style="width: 600px;height: 800px;background-color: white">
            <center>
                <table>
                    <tr>
                        <td>
                            <div style="color: blue;font-weight: 700;font-size: 30px">注册</div>
                        </td>
                    </tr>
                </table>
            </center>
            <hr>
            <center>
                <form action="${pageContext.request.contextPath}/user/register?action=register" method="post"
                      class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">账号：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_username" id="username" onblur="CheckUserName()"
                                   class="form-control"/>
                            <em id="m_username"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">密码：</label>
                        <div class="col-sm-8">
                            <input type="password" name="k_password" id="password" onblur="CheckPassword()"
                                   class="form-control"/>
                            <em id="m_password"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password2" class="col-sm-3 control-label">确认密码：</label>
                        <div class="col-sm-8">
                            <span>
                            <input type="password" name="k_password2" id="password2" onblur="CheckPassword2()"
                                   class="form-control"/>
                                </span>
                            <span>
                            <em id="m_password2"></em>
                                </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_name" id="name" class="form-control"/>
                            <em id="m_name"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">邮箱：</label>
                        <div class="col-sm-8">
                            <input type="email" name="k_email" id="email" onblur="CheckEmail()" class="form-control"/>
                            <em id="m_email"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">手机号码：</label>
                        <div class="col-sm-3">
                            <select name="k_tPhone" style="width: 100%;height: 39px;float:left;">
                                <option value="ch">中国大陆+86</option>
                                <option value="hk">香港+852</option>
                                <option value="mc">澳门+853</option>
                                <option value="tw">台湾+886</option>
                                <option value="kr">韩国+82</option>
                                <option value="jp">日本+81</option>
                                <option value="ac">美国+1</option>
                                <option value="cnd">加拿大+1</option>
                                <option value="el">英国+44</option>
                                <option value="mls">马来西亚+60</option>
                                <option value="tl">泰国+66</option>
                                <option value="vtn">越南+84</option>
                                <option value="fc">法国+33</option>
                                <option value="plp">菲律宾+63</option>
                                <option value="idns">印度尼西亚+62</option>
                                <option value="itl">意大利+39</option>
                                <option value="rs">俄罗斯+7</option>
                                <option value="zl">新西兰+64</option>
                                <option value="nl">荷兰+31</option>
                                <option value="swd">瑞典+46</option>
                                <option value="atl">澳大利亚+61</option>
                                <option value="gm">德国+49</option>
                            </select>
                        </div>
                        <div class="col-sm-5">
                            <input type="text" name="k_phone" id="phone" class="form-control"/>
                            <em id="m_phone"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qq" class="col-sm-3 control-label">QQ号码：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_qq" id="qq" class="form-control"/>
                            <em id="m_qq"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="weChat" class="col-sm-3 control-label">微信：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_weChat" id="weChat" class="form-control"/>
                            <em id="m_weChat"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="money" class="col-sm-3 control-label">默认赏金：</label>
                        <div class="col-sm-8">
                            <select name="k_money" id="money" class="form-control">
                                <option value="0">请选择</option>
                                <option value="2">2元</option>
                                <option value="3">3元</option>
                                <option value="4">4元</option>
                                <option value="5">5元</option>
                                <option value="6">6元</option>
                                <option value="7">7元</option>
                                <option value="8">8元</option>
                                <option value="9">9元</option>
                                <option value="10">10元</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">包裹放置地：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_address" id="address" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <%
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                Date date = simpleDateFormat.parse(simpleDateFormat.format(new Date()));
                            %>
                            <input type="hidden" name="k_registerTime" value="<%=date%>" id="date" multiple/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <input type="submit" value="注册" class="btn btn-primary"
                                   style="width:240px;height:30px;background-color: blue;color: white"/>
                        </div>
                    </div>
                </form>
            </center>
        </div>
    </div>
</div>
</body>
</html>
