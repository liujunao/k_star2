<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/13
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>聊天室</title>
    <script src="/statics/utf8-jsp/ueditor.config.js"></script>
    <script src="/statics/utf8-jsp/ueditor.all.js"></script>
    <script src="/statics/js/jquery-3.2.1.js"></script>
    <script>
        $(function () {
            var status = "<%=request.getSession().getAttribute("status")%>";
            var chatStatus = 0;

            var editor = UE.ui.Editor();
            editor.render("text");
            var url = "ws://localhost:8080/webSocket";
            var webSocket = null;
            webSocket = new WebSocket(url);
            //连接关闭的回调方法
            webSocket.onclose = function () {
                console.log("连接关闭！" + getNowFormatDate());
            };
            //连接失败的回调方法
            webSocket.onerror = function () {
                console.log("连接失败！");
            };
            //连接成功的回调方法
            webSocket.onopen = function () {
                console.log("连接成功！");
            }
            //接收到的回调方法
            webSocket.onmessage = function (event) {//如果获取到消息，心跳检测重置
                console.log("收到的消息： " + event.data);
                var json = $.parseJSON(event.data);
                var list = "<li>";
                list += json.time + " " + json.myName + ":<br>";
                list += json.text;
                list += "</li>";
                $("#now").html(list);
                if (json.chatStatus == 1){
                    status = 1;
                }
                console.log("status:" + status);
            }

            window.onbeforeunload = function () {
                webSocket.close();
            }
            $("#but").click(function () {
                webSocket.send(JSON.stringify({
                    myName: $("#myName").val(),
                    myId: $("#myId").val(),
                    otherName: $("#otherName").val(),
                    otherId: $("#otherId").val(),
                    text: editor.getContent(),
                    time: getNowFormatDate(),
                    chatStatus:1
                }));
                editor.setContent('');
                editor.focus();
            })
            if (status == 0){
                $.post(
                    "/kuaidi/chatMessage",
                    {
                        "k_chatOtherId":$("#otherId").val(),
                        "k_chatMyId":$("#myId").val()
                    },
                    function (data) {
                        var list = "";
                        $.each($.parseJSON(data),function (num,content) {
                            list += "<li>";
                            list += content.k_chatTime + " " + content.k_chatMyName + ":<br>";
                            list += content.k_chatMessage;
                            list += "</li>";
                            $("#before").html(list);
                        })
                    }
                )
            }
        })

        function getNowFormatDate() {
            var myDate = new Date();
            myDate.getYear();        //获取当前年份(2位)
            myDate.getFullYear();    //获取完整的年份(4位,1970-????)
            myDate.getMonth();       //获取当前月份(0-11,0代表1月)
            myDate.getDate();        //获取当前日(1-31)
            myDate.getDay();         //获取当前星期X(0-6,0代表星期天)
            myDate.getTime();        //获取当前时间(从1970.1.1开始的毫秒数)
            myDate.getHours();       //获取当前小时数(0-23)
            myDate.getMinutes();     //获取当前分钟数(0-59)
            myDate.getSeconds();     //获取当前秒数(0-59)
            myDate.getMilliseconds();    //获取当前毫秒数(0-999)
            myDate.toLocaleDateString();     //获取当前日期
            var myTime = myDate.toLocaleTimeString();//获取当前时间
            return myDate.toLocaleString();
        }
    </script>
</head>
<body>

<div>
    <ul id="chat">
        <ul id="before"></ul>
        <ul id="now"></ul>
    </ul>
    <input type="hidden" id="myName" name="myName" value="${mapMyInfo.k_username}"/>
    <input type="hidden" id="myId" name="myId" value="${mapMyInfo.k_id}"/>
    <input type="hidden" id="otherName" name="otherName" value="${mapInfo.k_username}"/>
    <input type="hidden" id="otherId" name="otherId" value="${mapInfo.k_id}"/>
    <textarea id="text" name="text"></textarea>
    <button id="but">发送</button>
    <script>

    </script>
</div>

</body>
</html>
