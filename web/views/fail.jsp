<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/2
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>结果页面</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>
<div style="top: 50%">
    <center>
        <div style="height: 40%;">
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
        <br>
        <br>
        <div>
            <h1>${msg}...</h1>
            <br>
            <br>
            <c:if test="${message == 'register'}">
                <a href="${pageContext.request.contextPath}/views/login.jsp">
                    <button class="btn btn-success">已完成邮箱验证</button>
                </a>
            </c:if>
            <c:if test="${message == 'revise'}">
                <a href="${pageContext.request.contextPath}/views/index.jsp">
                    <button class="btn btn-success">已完成邮箱验证</button>
                </a>
            </c:if>
            <a href="${pageContext.request.contextPath}/views/login.jsp">
                <button class="btn btn-success">返回登录页面</button>
            </a>
        </div>
    </center>
</div>

</body>
</html>
