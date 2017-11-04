<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/21
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="reCommon.jsp" %>
<html>
<head>
    <title>评价页面</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="/statics/js/alertCommon.js"></script>

    <script type="text/javascript">
        $(function () {
            var flag1 = 0;
            var flag2 = 0;
            var flag3 = 0;

            $("#star1").click(function () {
                if ($("#star_h1").val() == 0) {
                    $("#star1").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h1").value = 1;
                    flag1 += 1;
                } else if ($("#star_h1").val() == 1) {
                    $("#star1").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h1").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star2").click(function () {
                if ($("#star_h2").val() == 0) {
                    $("#star2").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h2").value = 1;
                    flag1 += 1;
                } else if ($("#star_h2").val() == 1) {
                    $("#star2").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h2").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star3").click(function () {
                if ($("#star_h3").val() == 0) {
                    $("#star3").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h3").value = 1;
                    flag1 += 1;
                } else if ($("#star_h3").val() == 1) {
                    $("#star3").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h3").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star4").click(function () {
                if ($("#star_h4").val() == 0) {
                    $("#star4").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h4").value = 1;
                    flag1 += 1;
                } else if ($("#star_h4").val() == 1) {
                    $("#star4").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h4").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star5").click(function () {
                if ($("#star_h5").val() == 0) {
                    $("#star5").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h5").value = 1;
                    flag1 += 1;
                } else if ($("#star_h5").val() == 1) {
                    $("#star5").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h5").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star6").click(function () {
                if ($("#star_h6").val() == 0) {
                    $("#star6").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h6").value = 1;
                    flag2 += 1;
                } else if ($("#star_h6").val() == 1) {
                    $("#star6").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h6").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star7").click(function () {
                if ($("#star_h7").val() == 0) {
                    $("#star7").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h7").value = 1;
                    flag2 += 1;
                } else if ($("#star_h7").val() == 1) {
                    $("#star7").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h7").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star8").click(function () {
                if ($("#star_h8").val() == 0) {
                    $("#star8").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h8").value = 1;
                    flag2 += 1;
                } else if ($("#star_h8").val() == 1) {
                    $("#star8").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h8").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star9").click(function () {
                if ($("#star_h9").val() == 0) {
                    $("#star9").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h9").value = 1;
                    flag2 += 1;
                } else if ($("#star_h9").val() == 1) {
                    $("#star9").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h9").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star10").click(function () {
                if ($("#star_h10").val() == 0) {
                    $("#star10").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h10").value = 1;
                    flag2 += 1;
                } else if ($("#star_h10").val() == 1) {
                    $("#star10").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h10").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star11").click(function () {
                if ($("#star_h11").val() == 0) {
                    $("#star11").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h11").value = 1;
                    flag3 += 1;
                } else if ($("#star_h11").val() == 1) {
                    $("#star11").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h11").value = 0;
                    flag3 -= 1;
                }
            })
            $("#star12").click(function () {
                if ($("#star_h12").val() == 0) {
                    $("#star12").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h12").value = 1;
                    flag3 += 1;
                } else if ($("#star_h12").val() == 1) {
                    $("#star12").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h12").value = 0;
                    flag3 -= 1;
                }
            })
            $("#star13").click(function () {
                if ($("#star_h13").val() == 0) {
                    $("#star13").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h13").value = 1;
                    flag3 += 1;
                } else if ($("#star_h13").val() == 1) {
                    $("#star13").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h13").value = 0;
                    flag3 -= 1;
                }
            })
            $("#star14").click(function () {
                if ($("#star_h14").val() == 0) {
                    $("#star14").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h14").value = 1;
                    flag3 += 1;
                } else if ($("#star_h14").val() == 1) {
                    $("#star14").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h14").value = 0;
                    flag3 -= 1;
                }
            })
            $("#star15").click(function () {
                if ($("#star_h15").val() == 0) {
                    $("#star15").attr("src", "${pageContext.request.contextPath}/statics/images/star_red.png");
                    document.getElementById("star_h15").value = 1;
                    flag3 += 1;
                } else if ($("#star_h15").val() == 1) {
                    $("#star15").attr("src", "${pageContext.request.contextPath}/statics/images/star.png");
                    document.getElementById("star_h15").value = 0;
                    flag3 -= 1;
                }
            })

            $("#submit").click(function () {
                $.post(
                    "/k_star2_war/kuaidi/appraise",
                    {
                        "grade1": flag1,
                        "grade2": flag2,
                        "grade3": flag3,
                        "k_infoId":${mapInfo.k_id},
                        "text": $("#text").val()
                    },
                    function (data) {
                        if (data == "ok") {
                            window.location.href = "${pageContext.request.contextPath}/views/message.jsp";
                        } else {
                            window.location.href = "${pageContext.request.contextPath}/views/appraise.jsp";
                            var msg = "<%=request.getAttribute("msg")%>";
                            mine(msg);
                        }
                    }
                )
            })

        })
    </script>
</head>
<body>
<div>
    <div style="width: 1349px; height: 600px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto;
    position: relative; z-index: 1;background-size: cover; background: url(${pageContext.request.contextPath}/statics/images/release.jpg) no-repeat 50% 50%;">
        <div style="position: absolute; top: 70px; left: 400px; width: 600px; height: 400px;">
            <div style="width: 600px;height: 500px;background-color: white;">
                <center>
                    <div style="color: blue;font-weight: 700;font-size: 30px;float: none;">评价栏</div>
                </center>
                <div style="float: right;font-weight: 600;font-size: 20px;color: #00a0e9;">
                    评价对象：${mapInfo.k_username}
                </div>
                <br><br><hr>
                <center>
                    <form role="form">
                        <div class="form-group" style="height: 100px;">
                            <label for="text" class="col-sm-3 control-label">综合评价：</label>
                            <div class="col-sm-7">
                                <textarea id="text" class="form-control" style="height: 100px;" placeholder="选填"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <c:if test="${kind eq 'mine'}">
                                <label for="grade1" class="col-sm-3 control-label"style="float: left;">取货速度：</label>
                            </c:if>
                            <c:if test="${kind eq 'other'}">
                                <label for="grade1" class="col-sm-3 control-label" style="float: left;">负责态度：</label>
                            </c:if>
                            <div class="col-sm-7">
                                <div id="grade1">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star1">
                                        <input type="hidden" value="0" id="star_h1"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star2">
                                        <input type="hidden" value="0" id="star_h2"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star3">
                                        <input type="hidden" value="0" id="star_h3"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star4">
                                        <input type="hidden" value="0" id="star_h4"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star5">
                                        <input type="hidden" value="0" id="star_h5"/>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="grade2" class="col-sm-3 control-label" style="float: left;">沟通态度：</label>
                            <div class="col-sm-7">
                                <div id="grade2">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star6">
                                        <input type="hidden" value="0" id="star_h6"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star7">
                                        <input type="hidden" value="0" id="star_h7"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star8">
                                        <input type="hidden" value="0" id="star_h8"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star9">
                                        <input type="hidden" value="0" id="star_h9"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star10">
                                        <input type="hidden" value="0" id="star_h10"/>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="grade3" class="col-sm-3 control-label" style="float: left;">诚信度：</label>
                            <div class="col-sm-7">
                                <div id="grade3">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star11">
                                        <input type="hidden" value="0" id="star_h11"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star12">
                                        <input type="hidden" value="0" id="star_h12"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star13">
                                        <input type="hidden" value="0" id="star_h13"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star14">
                                        <input type="hidden" value="0" id="star_h14"/>
                                    </span>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/statics/images/star.png" id="star15">
                                        <input type="hidden" value="0" id="star_h15"/>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-11">
                                <input type="button" value="提交" class="btn btn-primary" id="submit"
                                       style="width:240px;height:30px;background-color: blue;color: white"/>
                            </div>
                        </div>
                    </form>
                </center>
            </div>
        </div>
    </div>
</div>

</body>
</html>
