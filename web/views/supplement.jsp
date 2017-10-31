<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/3
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="reCommon.jsp" %>
<html>
<head>
    <title>信息变更</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        function CheckString(string) {
            if (string.indexOf(" ") > -1) {
                return true;
            }
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

        function mine() {
            var msg = "<%=request.getAttribute("msg")%>";
            if (msg != null && msg != "null"){
                alert(msg);
            }
        }
        window.onload = mine;
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

</head>
<body>

<div style="width: 1349px; height: 1000px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1;
background-size: cover; background: url(${pageContext.request.contextPath}/statics/images/supplement.jpg) no-repeat;">
    <div style="position: absolute; top: 70px; left: 400px; width: 450px; height: 400px;">
        <center>
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
        </center>
        <div style="width: 600px;height: 600px;background-color: white">
                <table>
                    <tr>
                        <td>
                            <div style="color: #808080;font-weight: 500;font-size: 30px" class='glyphicon glyphicon-asterisk'>账号设置</div>
                        </td>
                    </tr>
                </table>
            <hr>
            <center>
                <form action="${pageContext.request.contextPath}/kuaidi/supplement" method="post"
                      class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">账号：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_username" id="username" onblur="CheckUserName()"
                                   class="form-control" value="<%=map.get("k_username")%>"/>
                            <em id="m_username"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_name" id="name" class="form-control" value="<%=map.get("k_name")%>"/>
                            <em id="m_name"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">邮箱：</label>
                        <div class="col-sm-8">
                            <input type="email" name="k_email" id="email" onblur="CheckEmail()" class="form-control" value="<%=map.get("k_email")%>"/>
                            <em id="m_email"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">手机号码：</label>
                        <div class="col-sm-3">
                            <select name="k_tPhone" style="width: 100%;height: 39px;float:left;">
                                <option value="ch" <c:if test="${sessionScope.k_info.k_tPhone == 'ch'}">selected</c:if>>中国大陆+86</option>
                                <option value="hk" <c:if test="${sessionScope.k_info.k_tPhone == 'hk'}">selected</c:if>>香港+852</option>
                                <option value="mc" <c:if test="${sessionScope.k_info.k_tPhone == 'mc'}">selected</c:if>>澳门+853</option>
                                <option value="tw" <c:if test="${sessionScope.k_info.k_tPhone == 'tw'}">selected</c:if>>台湾+886</option>
                                <option value="kr" <c:if test="${sessionScope.k_info.k_tPhone == 'kr'}">selected</c:if>>韩国+82</option>
                                <option value="jp" <c:if test="${sessionScope.k_info.k_tPhone == 'jp'}">selected</c:if>>日本+81</option>
                                <option value="ac" <c:if test="${sessionScope.k_info.k_tPhone == 'ac'}">selected</c:if>>美国+1</option>
                                <option value="cnd" <c:if test="${sessionScope.k_info.k_tPhone == 'cnd'}">selected</c:if>>加拿大+1</option>
                                <option value="el" <c:if test="${sessionScope.k_info.k_tPhone == 'el'}">selected</c:if>>英国+44</option>
                                <option value="mls" <c:if test="${sessionScope.k_info.k_tPhone == 'mls'}">selected</c:if>>马来西亚+60</option>
                                <option value="tl" <c:if test="${sessionScope.k_info.k_tPhone == 'tl'}">selected</c:if>>泰国+66</option>
                                <option value="vtn" <c:if test="${sessionScope.k_info.k_tPhone == 'vtn'}">selected</c:if>>越南+84</option>
                                <option value="fc" <c:if test="${sessionScope.k_info.k_tPhone == 'fc'}">selected</c:if>>法国+33</option>
                                <option value="plp" <c:if test="${sessionScope.k_info.k_tPhone == 'plp'}">selected</c:if>>菲律宾+63</option>
                                <option value="idns" <c:if test="${sessionScope.k_info.k_tPhone == 'idns'}">selected</c:if>>印度尼西亚+62</option>
                                <option value="itl" <c:if test="${sessionScope.k_info.k_tPhone == 'itl'}">selected</c:if>>意大利+39</option>
                                <option value="rs" <c:if test="${sessionScope.k_info.k_tPhone == 'rs'}">selected</c:if>>俄罗斯+7</option>
                                <option value="zl" <c:if test="${sessionScope.k_info.k_tPhone == 'zl'}">selected</c:if>>新西兰+64</option>
                                <option value="nl" <c:if test="${sessionScope.k_info.k_tPhone == 'nl'}">selected</c:if>>荷兰+31</option>
                                <option value="swd" <c:if test="${sessionScope.k_info.k_tPhone == 'swd'}">selected</c:if>>瑞典+46</option>
                                <option value="atl" <c:if test="${sessionScope.k_info.k_tPhone == 'atl'}">selected</c:if>>澳大利亚+61</option>
                                <option value="gm" <c:if test="${sessionScope.k_info.k_tPhone == 'gm'}">selected</c:if>>德国+49</option>
                            </select>
                        </div>
                        <div class="col-sm-5">
                            <input type="text" name="k_phone" id="phone" class="form-control" value="<%=map.get("k_phone")%>"/>
                            <em id="m_phone"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qq" class="col-sm-3 control-label">QQ号码：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_qq" id="qq" class="form-control" value="<%=map.get("k_qq")%>"/>
                            <em id="m_qq"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="weChat" class="col-sm-3 control-label">微信：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_weChat" id="weChat" class="form-control" value="<%=map.get("k_weChat")%>"/>
                            <em id="m_weChat"></em>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="money" class="col-sm-3 control-label">默认赏金：</label>
                        <div class="col-sm-8">
                            <select name="k_money" id="money" class="form-control">
                                <option value="2" <c:if test="${sessionScope.k_info.k_money == 2 }">selected</c:if>>2元</option>
                                <option value="3" <c:if test="${sessionScope.k_info.k_money == 3 }">selected</c:if>>3元</option>
                                <option value="4" <c:if test="${sessionScope.k_info.k_money == 4 }">selected</c:if>>4元</option>
                                <option value="5" <c:if test="${sessionScope.k_info.k_money == 5 }">selected</c:if>>5元</option>
                                <option value="6" <c:if test="${sessionScope.k_info.k_money == 6 }">selected</c:if>>6元</option>
                                <option value="7" <c:if test="${sessionScope.k_info.k_money == 7 }">selected</c:if>>7元</option>
                                <option value="8" <c:if test="${sessionScope.k_info.k_money == 8 }">selected</c:if>>8元</option>
                                <option value="9" <c:if test="${sessionScope.k_info.k_money == 9 }">selected</c:if>>9元</option>
                                <option value="10" <c:if test="${sessionScope.k_info.k_money == 10 }">selected</c:if>>10元</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">包裹放置地：</label>
                        <div class="col-sm-8">
                            <input type="text" name="k_address" id="address" class="form-control" value="<%=map.get("k_address")%>"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-11">
                            <input type="submit" value="确认修改" class="btn btn-primary"
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
