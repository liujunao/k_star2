<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/21
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/statics/js/jquery-3.2.1.js"></script>
    <script>
        $(function () {
            $("#star1").click(function () {
                if ($("#star_h1").val() == 0) {
                    $("#star1").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h1").value = 1;
                }else if ($("#star_h1").val() == 1) {
                    $("#star1").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h1").value = 0;
                }
            })
        })
    </script>
</head>
<body>

<img src="${pageContext.request.contextPath}/statics/images/star.png" id="star1">
<input type="hidden" value="0" id="star_h1"/>


</body>
</html>
