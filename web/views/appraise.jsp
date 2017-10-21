<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/21
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>评价页面</title>
    <script type="text/javascript" src="/statics/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/statics/js/alertCommon.js"></script>

    <script>
        $(function () {
            var flag1 = 0;
            var flag2 = 0;
            var flag3 = 0;

            $("#star1").click(function () {
                if ($("#star_h1").val() == 0) {
                    $("#star1").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h1").value = 1;
                    flag1 += 1;
                } else if ($("#star_h1").val() == 1) {
                    $("#star1").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h1").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star2").click(function () {
                if ($("#star_h2").val() == 0) {
                    $("#star2").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h2").value = 1;
                    flag1 += 1;
                } else if ($("#star_h2").val() == 1) {
                    $("#star2").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h2").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star3").click(function () {
                if ($("#star_h3").val() == 0) {
                    $("#star3").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h3").value = 1;
                    flag1 += 1;
                } else if ($("#star_h3").val() == 1) {
                    $("#star3").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h3").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star4").click(function () {
                if ($("#star_h4").val() == 0) {
                    $("#star4").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h4").value = 1;
                    flag1 += 1;
                } else if ($("#star_h4").val() == 1) {
                    $("#star4").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h4").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star5").click(function () {
                if ($("#star_h5").val() == 0) {
                    $("#star5").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h5").value = 1;
                    flag1 += 1;
                } else if ($("#star_h5").val() == 1) {
                    $("#star5").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h5").value = 0;
                    flag1 -= 1;
                }
            })
            $("#star6").click(function () {
                if ($("#star_h6").val() == 0) {
                    $("#star6").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h6").value = 1;
                    flag2 += 1;
                } else if ($("#star_h6").val() == 1) {
                    $("#star6").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h6").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star7").click(function () {
                if ($("#star_h7").val() == 0) {
                    $("#star7").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h7").value = 1;
                    flag2 += 1;
                } else if ($("#star_h7").val() == 1) {
                    $("#star7").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h7").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star8").click(function () {
                if ($("#star_h8").val() == 0) {
                    $("#star8").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h8").value = 1;
                    flag2 += 1;
                } else if ($("#star_h8").val() == 1) {
                    $("#star8").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h8").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star9").click(function () {
                if ($("#star_h9").val() == 0) {
                    $("#star9").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h9").value = 1;
                    flag2 += 1;
                } else if ($("#star_h9").val() == 1) {
                    $("#star9").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h9").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star10").click(function () {
                if ($("#star_h10").val() == 0) {
                    $("#star10").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h10").value = 1;
                    flag2 += 1;
                } else if ($("#star_h10").val() == 1) {
                    $("#star10").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h10").value = 0;
                    flag2 -= 1;
                }
            })
            $("#star11").click(function () {
                if ($("#star_h11").val() == 0) {
                    $("#star11").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h11").value = 1;
                    flag3 += 1;
                } else if ($("#star_h11").val() == 1) {
                    $("#star11").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h11").value = 0;
                    flag3 -= 1;
                }
            })
            $("#star12").click(function () {
                if ($("#star_h12").val() == 0) {
                    $("#star12").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h12").value = 1;
                    flag3 += 1;
                } else if ($("#star_h12").val() == 1) {
                    $("#star12").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h12").value = 0;
                    flag3 -= 1;
                }
            })
            $("#star13").click(function () {
                if ($("#star_h13").val() == 0) {
                    $("#star13").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h13").value = 1;
                    flag3 += 1;
                } else if ($("#star_h13").val() == 1) {
                    $("#star13").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h13").value = 0;
                    flag3 -= 1;
                }
            })
            $("#star14").click(function () {
                if ($("#star_h14").val() == 0) {
                    $("#star14").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h14").value = 1;
                    flag3 += 1;
                } else if ($("#star_h14").val() == 1) {
                    $("#star14").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h14").value = 0;
                    flag3 -= 1;
                }
            })
            $("#star15").click(function () {
                if ($("#star_h15").val() == 0) {
                    $("#star15").attr("src", "/statics/images/star_red.png");
                    document.getElementById("star_h15").value = 1;
                    flag3 += 1;
                } else if ($("#star_h15").val() == 1) {
                    $("#star15").attr("src", "/statics/images/star.png");
                    document.getElementById("star_h15").value = 0;
                    flag3 -= 1;
                }
            })

            $("#submit").click(function () {
                $.post(
                    "/kuaidi/appraise",
                    {
                        "grade1":flag1,
                        "grade2":flag2,
                        "grade3":flag3,
                        "k_infoId":${mapInfo.k_id},
                        "text":$("#text").val()
                    },
                    function (data) {
                        console.log(data);
                        console.log(data == "ok");
                        if (data == "ok"){
                            window.location.href = "/views/message.jsp";
                        }else {
                            window.location.href = "/views/appraise.jsp";
                            var msg = "<%=request.getAttribute("msg")%>";
                            mine(msg);
                        }
                    }
                )
            })

            $("#history").click(function () {
                $.post(
                    "/kuaidi/lookAppraise",
                    {
                        "id":${mapInfo.k_id }
                    },
                    function (data) {
                        var kindLook = "<%=request.getAttribute("kind")%>";
                        var typeLook = "";
                        console.log(kindLook);
                        if (kindLook == "mine"){
                            typeLook = "取货速度";
                        }else if (kindLook == "other"){
                            typeLook = "负责态度";
                        }
                        var list = "";
                        $.each($.parseJSON(data),function (num,content) {
                            list = "<li>";
                            if (content.k_apText != null){
                                list += "综合评价: ";
                                list += content.k_apText;
                            }
                            list += typeLook + ": " + content.k_apGrade1;
                            list += "沟通态度: " + content.k_apGrade2;
                            list += "诚信度: " + content.k_apGrade3;
                            list += "</li>";
                            $("#listLook").html(list);
                        })
                    }
                )
            })

        })
    </script>
</head>
<body>
<div>
    <ul id="listLook"></ul>
    <table>
        <tr>
            <td>${mapInfo.k_username}</td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <td></td>
            <td id="history">查看历史评价</td>
        </tr>
        <tr>
            <td>综合评价</td>
            <td>
                <textarea id="text"></textarea>
            </td>
        </tr>
        <%--<c:if test="${kind != null}">--%>
            <tr>
                <c:if test="${kind eq 'mine'}">
                    <td>取货速度</td>
                </c:if>
                <c:if test="${kind eq 'other'}">
                    <td>负责态度</td>
                </c:if>
                <td>
                    <div>
                        <img src="/statics/images/star.png" id="star1">
                        <input type="hidden" value="0" id="star_h1"/>
                    </div>
                </td>
                <td>
                    <div>
                        <img src="/statics/images/star.png" id="star2">
                        <input type="hidden" value="0" id="star_h2"/>
                    </div>
                </td>
                <td>
                    <div>
                        <img src="/statics/images/star.png" id="star3">
                        <input type="hidden" value="0" id="star_h3"/>
                    </div>
                </td>
                <td>
                    <div>
                        <img src="/statics/images/star.png" id="star4">
                        <input type="hidden" value="0" id="star_h4"/>
                    </div>
                </td>
                <td>
                    <div>
                        <img src="/statics/images/star.png" id="star5">
                        <input type="hidden" value="0" id="star_h5"/>
                    </div>
                </td>
            </tr>
        <%--</c:if>--%>

        <tr>
            <td>沟通态度</td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star6">
                    <input type="hidden" value="0" id="star_h6"/>
                </div>
            </td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star7">
                    <input type="hidden" value="0" id="star_h7"/>
                </div>
            </td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star8">
                    <input type="hidden" value="0" id="star_h8"/>
                </div>
            </td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star9">
                    <input type="hidden" value="0" id="star_h9"/>
                </div>
            </td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star10">
                    <input type="hidden" value="0" id="star_h10"/>
                </div>
            </td>
        </tr>

        <tr>
            <td>诚信度</td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star11">
                    <input type="hidden" value="0" id="star_h11"/>
                </div>
            </td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star12">
                    <input type="hidden" value="0" id="star_h12"/>
                </div>
            </td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star13">
                    <input type="hidden" value="0" id="star_h13"/>
                </div>
            </td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star14">
                    <input type="hidden" value="0" id="star_h14"/>
                </div>
            </td>
            <td>
                <div>
                    <img src="/statics/images/star.png" id="star15">
                    <input type="hidden" value="0" id="star_h15"/>
                </div>
            </td>
        </tr>

        <tr><td><input type="button" value="提交" id="submit"/></td></tr>

    </table>
</div>

</body>
</html>
