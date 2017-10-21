package com.springmvc.controller;

import com.springmvc.common.JsonCommon;
import com.springmvc.model.K_chat;
import com.springmvc.service.K_chatService;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Created by lenovo on 2017/10/12.
 */
@ServerEndpoint("/webSocket")
public class ChatServer {

    private static CopyOnWriteArraySet<ChatServer> webSocket = new CopyOnWriteArraySet<>();

    private Session session;

    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    //连接建立成功调用的方法
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        webSocket.add(this);
        System.out.println("连接成功！" + simpleDateFormat.format(new Date()));
    }

    //收到客户端消息后调用的方法
    @OnMessage
    public void onMessage(String message) {
        for (ChatServer chatServer : webSocket) {
                try {
                    Date date = new Date();
                    JsonCommon jsonCommon = new JsonCommon();
                    Map<String, Object> jsonMap = jsonCommon.getObject(message,Map.class);
                    K_chat k_chat = new K_chat();
                    k_chat.setK_chatMyName(jsonMap.get("myName").toString());
                    k_chat.setK_chatMyId(Integer.parseInt(jsonMap.get("myId").toString()));
                    k_chat.setK_chatOtherName(jsonMap.get("otherName").toString());
                    k_chat.setK_chatOtherId(Integer.parseInt(jsonMap.get("otherId").toString()));
                    k_chat.setK_chatMessage(jsonMap.get("text").toString());
                    k_chat.setK_chatTime(simpleDateFormat.format(date));
                    K_chatService k_chatService = new K_chatService();
                    int result = -1;
                    result = k_chatService.add(k_chat);
                    if (result > 0) {
                        System.out.println("聊天信息存储成功！");
                        jsonMap.put("simTime",simpleDateFormat.format(date));
                        String json = jsonCommon.getJsonString(jsonMap);
                        chatServer.sendMeaasge(json);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
    }

    private void sendMeaasge(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }

    @OnError
    public void onError(Throwable throwable) {
        throwable.printStackTrace();
        System.out.println("连接失败！" + simpleDateFormat.format(new Date()));
    }

    //连接关闭调用的方法
    @OnClose
    public void onClose() {
        webSocket.remove(this);
        System.out.println("连接关闭！" + simpleDateFormat.format(new Date()));
    }

}
