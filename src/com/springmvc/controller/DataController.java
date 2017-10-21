package com.springmvc.controller;

import com.springmvc.common.HtmlCommon;
import com.springmvc.common.JsonCommon;
import com.springmvc.common.TypeCommon;
import com.springmvc.kdHelper.DataList;
import com.springmvc.kdHelper.KDModel;
import com.springmvc.model.*;
import com.springmvc.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by lenovo on 2017/9/26.
 */
@RequestMapping("/kuaidi")
@Controller
public class DataController {

    @RequestMapping("/chaxun")
    public String queryData(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String num = request.getParameter("orderNumber");
        String type = request.getParameter("type");

        DataList dataList = new DataList();
        List<KDModel> data = dataList.getData(num, type);
        request.setAttribute("orderNumber", num);
        request.setAttribute("type", type);
        request.setAttribute("time", data.get(0).getTime());
        request.setAttribute("context", data.get(0).getContext());
        Map<String, Object> k_infoMap = (Map<String, Object>) request.getSession().getAttribute("k_info");
        int k_infoId = Integer.parseInt(k_infoMap.get("k_id").toString());

        TypeCommon typeCommon = new TypeCommon();
        K_exService k_exService = new K_exService();
        K_ex k_ex = new K_ex();
        k_ex.setK_number(num);
        List<Map<String, Object>> list = k_exService.queryByNumber(k_ex);
        if (list != null && list.size() != 0) {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> map = null;
                map = list.get(i);
                for (int j = 0; j < data.size(); j++) {
                    KDModel kdModel = new KDModel();
                    kdModel = data.get(j);
                    if (kdModel.getTime().equals(map.get("k_time"))) {
                        data.remove(j);
                    }
                }
            }
            if (data != null && data.size() > 0) {
                for (int t = 0; t < data.size(); t++) {
                    k_ex = new K_ex();
                    k_ex.setK_number(num);
                    k_ex.setK_type(typeCommon.typeToString(type));
                    k_ex.setK_infoId(k_infoId);
                    k_ex.setK_time(data.get(t).getTime());
                    k_ex.setK_context(data.get(t).getContext());
                    k_ex.setK_status(0);
                    int result = -1;
                    result = k_exService.add(k_ex);
                    if (result > 0) {
                        HtmlCommon htmlCommon = new HtmlCommon();
                        htmlCommon.showMsg(response, "筛选后添加成功!!!");
                    }
                }
            }
        } else {
            for (int k = 0; k < data.size(); k++) {
                k_ex = new K_ex();
                k_ex.setK_number(num);
                k_ex.setK_type(typeCommon.typeToString(type));
                k_ex.setK_infoId(k_infoId);
                k_ex.setK_context(data.get(k).getContext());
                k_ex.setK_time(data.get(k).getTime());
                k_ex.setK_status(0);
                int result = -1;
                result = k_exService.add(k_ex);
                if (result > 0) {
                    System.out.println("添加成功！");
                }
            }
        }
        return "index";
    }

    @RequestMapping("/chaxunGd")
    public void queryDataGd(HttpServletRequest request, HttpServletResponse response) throws Exception {
        queryDataCommon(request, response);
    }

    @RequestMapping("/chaxunGd2")
    public String queryDataGd2(HttpServletRequest request) throws Exception {
        String num = request.getParameter("orderNumber2");
        if (num != null) {
            K_ex k_ex = new K_ex();
            k_ex.setK_number(num);
            K_exService k_exService = new K_exService();
            List<Map<String, Object>> list = k_exService.queryByNumber(k_ex);
            request.setAttribute("gd2List", list);
            return "index";
        } else {
            request.setAttribute("msg", "获取失败，请重试！");
            return "index";
        }

    }

    public void queryDataCommon(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String num = request.getParameter("orderNumber");
        K_ex k_ex = new K_ex();
        k_ex.setK_number(num);
        K_exService k_exService = new K_exService();
        List<Map<String, Object>> list = k_exService.queryByNumber(k_ex);
        if (list != null) {
            listToJson(list, response);
        } else {
            HtmlCommon htmlCommon = new HtmlCommon();
            htmlCommon.showMsg(response, "获取失败，请重试！", "/views/index.jsp");
            return;
        }

    }

    @RequestMapping("/supplement")
    public String supplement(HttpServletRequest request) {
        Map<String, Object> map = (Map<String, Object>) request.getSession().getAttribute("k_info");
        K_info k_info = new K_info();
        k_info.setK_id(Integer.parseInt(map.get("k_id").toString()));
        k_info.setK_username(request.getParameter("k_username"));
        k_info.setK_phone(request.getParameter("k_phone"));
        k_info.setK_qq(request.getParameter("k_qq"));
        k_info.setK_weChat(request.getParameter("k_weChat"));
        k_info.setK_email(request.getParameter("k_email"));
        K_infoService k_infoService = new K_infoService();
        int result = -1;
        result = k_infoService.updateSupplement(k_info);
        if (result > 0) {
            HtmlCommon htmlCommon = new HtmlCommon();
            HttpSession session = htmlCommon.getSession();
            K_info k_info1 = new K_info();
            k_info1.setK_id(Integer.parseInt(map.get("k_id").toString()));
            Map<String, Object> map1 = k_infoService.query(k_info1);
            session.setAttribute("k_info", map1);
            return "index";
        }
        return "supplement";
    }

    @RequestMapping("/showMine")
    public void showMine(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
        Map<String, Object> map = (Map<String, Object>) request.getSession().getAttribute("k_info");
        K_ex k_ex = new K_ex();
        K_exService k_exService = new K_exService();
        k_ex.setK_infoId(Integer.parseInt(map.get("k_id").toString()));
        List<Map<String, Object>> list = k_exService.queryAllByInfoId(k_ex);
        Map<String, Object> map1 = null;
        List<Map<String, Object>> list1 = new ArrayList<>();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Map<String, Object>> tempList = null;
        while (list.size() > 0) {
            tempList = new ArrayList<>();
            map1 = list.get(0);
            for (int i = 0; i < list.size(); i++) {
                if (map1.get("k_number").toString().equals(list.get(i).get("k_number").toString())) {
                    if (simpleDateFormat.parse(map1.get("k_time").toString()).getTime() < simpleDateFormat.parse(list.get(i).get("k_time").toString()).getTime()) {
                        map1 = list.get(i);
                    }
                    tempList.add(list.get(i));
                }
            }
            if (tempList.size() > 0) {
                for (int j = 0; j < tempList.size(); j++) {
                    list.remove(tempList.get(j));
                }
            }
            list1.add(map1);
        }
        listToJson(list1, response);
    }

    @RequestMapping("/release")
    public String release(K_re k_re, HttpServletRequest request) throws UnsupportedEncodingException, ParseException {
        request.setCharacterEncoding("utf-8");
        String save = request.getParameter("save");
        if (save.equals("no")) {
            HtmlCommon htmlCommon = new HtmlCommon();
            HttpSession session = htmlCommon.getSession();
            session.setAttribute("yesK_re", k_re);
            request.setAttribute("k_re", k_re);
            request.setAttribute("message", "任务填写成功，请查看！");
            return "release";
        } else if (save.equals("yes")) {
            K_reService k_reService = new K_reService();
            int result = -1;
            K_re sessionK_re = (K_re) request.getSession().getAttribute("yesK_re");
            String ymd = sessionK_re.getK_reTime().substring(0, 10);
            String hms = sessionK_re.getK_reTime().substring(11, 16);
            sessionK_re.setK_reTime(ymd + " " + hms + ":00");
            result = k_reService.add(sessionK_re);
            if (result > 0) {
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                K_me k_me = new K_me();
                k_me.setK_me_myId(Integer.parseInt(String.valueOf(sessionK_re.getK_re_infoId())));
                k_me.setK_me_myUsername(sessionK_re.getK_infoName());
                k_me.setK_meTime(simpleDateFormat.format(new Date()));
                k_me.setK_me_number(sessionK_re.getK_reNumber());
                k_me.setK_meStatus(0);
                k_me.setK_meWarn("您成功发布了快递单号为" + sessionK_re.getK_reNumber() + "的快递领取任务！");
                K_meService k_meService = new K_meService();
                int meResult = -1;
                meResult = k_meService.add(k_me);
                if (meResult > 0) {
                    System.out.println("任务发布成功消息添加成功！");
                }
                request.setAttribute("msg", "任务发布成功！");
                return "fail";
            } else {
                request.setAttribute("msg", "任务发布失败，请重新发布！");
                return "fail";
            }
        }
        return "release";
    }

    @RequestMapping("/forumAll")
    public void forumAll(HttpServletResponse response) throws IOException {
        K_reService k_reService = new K_reService();
        List<Map<String, Object>> list = k_reService.queryAll();
        listToJson(list, response);
    }

    @RequestMapping("/forumDetail")
    public String forumDetail(HttpServletRequest request) {
        String number = request.getParameter("number");
        Map<String, Object> mapDetail = reDetailCommon(number);
        if (mapDetail != null) {
            request.setAttribute("mapDetail", mapDetail);
            request.setAttribute("message", "查看成功");
            return "forum";
        } else {
            request.setAttribute("msg", "查看失败，请重试！");
            return "forum";
        }
    }

    @RequestMapping("/messageDetail")
    public String messageDetail(HttpServletRequest request) {
        String number = request.getParameter("number");
        String type = request.getParameter("type");
        Map<String, Object> mapDetail = null;
        if (type.equalsIgnoreCase("mine")) {
            mapDetail = reDetailCommon(number);
        } else if (type.equalsIgnoreCase("other")) {
            mapDetail = meDetailCommon(number);
        }
        if (mapDetail != null) {
            if (type.equalsIgnoreCase("mine")) {
                request.setAttribute("moType", "myMine");
            } else if (type.equalsIgnoreCase("other")) {
                request.setAttribute("moType", "myOther");
            }
            HtmlCommon htmlCommon = new HtmlCommon();
            HttpSession session = htmlCommon.getSession();
            Map<String, Object> map1 = (Map<String, Object>) session.getAttribute("k_info");
            request.setAttribute("id", map1.get("k_id"));
            request.setAttribute("mapDetail", mapDetail);
            request.setAttribute("message", "查看成功");
            return "message";
        } else {
            request.setAttribute("msg", "查看失败，请重试！");
            return "message";
        }
    }

    public Map<String, Object> reDetailCommon(String number) {
        K_reService k_reService = new K_reService();
        K_re k_re = new K_re();
        k_re.setK_reNumber(number);
        Map<String, Object> mapDetail = k_reService.queryDetail(k_re);
        return mapDetail;
    }

    public Map<String, Object> meDetailCommon(String number) {
        K_meService k_meService = new K_meService();
        K_me k_me = new K_me();
        k_me.setK_me_number(number);
        Map<String, Object> mapDetail = k_meService.queryByNumber(k_me);
        return mapDetail;
    }

    @RequestMapping("/releaseDetail")
    public void releaseDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String number = request.getParameter("releaseNumber");
        if (number != null) {
            K_reService k_reService = new K_reService();
            K_re k_re = new K_re();
            k_re.setK_reNumber(number);
            Map<String, Object> mapDetail = k_reService.queryDetail(k_re);
            if (mapDetail != null) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.flush();
                out.write("1");
                out.flush();
                out.close();
            }
        }
    }

    @RequestMapping("/forumTask")
    public String getTask(HttpServletRequest request) {
        String k_reId = request.getParameter("k_reId");
        String k_reStatus = request.getParameter("k_reStatus");
        String infoName = request.getParameter("username");
        if (k_reId != null && k_reStatus != null) {
            K_reService k_reService = new K_reService();
            K_re k_re = new K_re();
            k_re.setK_reStatus(Integer.parseInt(k_reStatus));
            k_re.setK_reId(Integer.parseInt(k_reId));
            int result = -1;
            result = k_reService.updateStatusById(k_re);
            if (result > 0) {
                k_re = new K_re();
                k_re.setK_reId(Integer.parseInt(k_reId));
                Map<String, Object> map1 = k_reService.queryById(k_re);
                HtmlCommon htmlCommon = new HtmlCommon();
                HttpSession session = htmlCommon.getSession();
                Map<String, Object> map = (Map<String, Object>) session.getAttribute("k_info");
                K_me k_me = new K_me();
                K_meService k_meService = new K_meService();
                k_me.setK_me_otherId(Integer.parseInt(map.get("k_id").toString()));
                k_me.setK_meTime(request.getParameter("meTime"));
                k_me.setK_meStatus(2);
                k_me.setK_me_reId(Integer.parseInt(map1.get("k_reId").toString()));
                k_me.setK_meWarn("您于" + map1.get("k_puTime") + "发布的快递单号为" + map1.get("k_reNumber") + "的任务已被" + map.get("k_username") + "领取");//xxx领取
                k_me.setK_meOtherWarn("您已成功领取" + map1.get("k_re_infoName") + "发布的任务");
                k_me.setK_me_number(map1.get("k_reNumber").toString());
                k_me.setK_me_otherUsername(infoName);
                int meResult = -1;
                meResult = k_meService.updateGet(k_me);
                if (meResult > 0) {
                    System.out.println("任务领取成功消息添加成功！");
                }
                request.setAttribute("msg", "任务领取成功，请注意查收！");
                return "fail";
            } else {
                request.setAttribute("msg", "任务领取失败，请重试！");
                return "fail";
            }
        } else {
            request.setAttribute("msg", "操作有误，请重试！");
            return "forum";
        }
    }

    @RequestMapping("/examineTime")
    public void examineTime(HttpServletRequest request) throws ParseException {
        String timeout = request.getParameter("timeout");
        K_reService k_reService = new K_reService();
        List<Map<String, Object>> list = k_reService.queryAll();
        Map<String, Object> mapTime = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                int result = -1;
                mapTime = list.get(i);
                if (simpleDateFormat.parse(simpleDateFormat.format(new Date(timeout))).getTime() >
                        simpleDateFormat.parse(mapTime.get("k_reTime").toString()).getTime()) {
                    K_re k_re = new K_re();
                    k_re.setK_reStatus(3);
                    k_re.setK_reId(Integer.parseInt(mapTime.get("k_reId").toString()));
                    result = k_reService.updateStatusById(k_re);
                    if (result > 0) {
                        K_meService k_meService = new K_meService();
                        K_me k_me = new K_me();
                        k_me.setK_me_number(mapTime.get("k_reNumber").toString());
                        Map<String, Object> mapStatus = k_meService.queryByNumber(k_me);
                        if (mapStatus.get("k_meStatus").toString().equals("0")) {
                            k_me = new K_me();
                            k_me.setK_me_number(mapTime.get("k_reNumber").toString());
                            k_me.setK_meStatus(3);
                            k_me.setK_meWarn("您于" + mapTime.get("k_re_puTime") + "发布的快递单号为" + mapTime.get("k_reNumber") + "的任务已过期！");
                            int reResult = -1;
                            reResult = k_meService.updatePast(k_me);
                            if (reResult > 0) {
                                System.out.println("时间过期消息添加成功！");
                            }
                        }
                        System.out.println("时间过期后修改信息成功！");
                    } else {
                        System.out.println("时间过期后修改信息失败！");
                    }
                }
            }
        }

    }

    @RequestMapping("/puMessage")
    public void puMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String k_re_infoId = request.getParameter("k_re_infoId");
        if (k_re_infoId != null) {
            K_re k_re = new K_re();
            k_re.setK_re_infoId(Integer.parseInt(k_re_infoId));
            K_reService k_reService = new K_reService();
            List<Map<String, Object>> list = k_reService.queryByInfoId(k_re);
            if (list != null) {
                listToJson(list, response);
            }
        }

    }

    @RequestMapping("/messageMine")
    public void messageMine(HttpServletResponse response, HttpServletRequest request) throws IOException {
        String k_me_myId = request.getParameter("k_me_myId");
        if (k_me_myId != null) {
            K_meService k_meService = new K_meService();
            K_me k_me = new K_me();
            k_me.setK_me_myId(Integer.parseInt(k_me_myId));
            k_me.setK_me_otherId(Integer.parseInt(k_me_myId));
            List<Map<String, Object>> list = k_meService.queryMine(k_me);
            listToJson(list, response);
        }
    }

    @RequestMapping("/messageDone")
    public String messageDone(HttpServletRequest request) {
        String number = request.getParameter("number");
        String k_infoId = request.getParameter("k_infoId");
        String type = request.getParameter("type");
        K_me k_me = new K_me();
        k_me.setK_me_number(number);
        k_me.setK_meStatus(1);
        K_meService k_meService = new K_meService();
        int result = k_meService.updateStatus(k_me);
        if (result > 0) {
            K_re k_re = new K_re();
            k_re.setK_reId(0);
            k_re.setK_reNumber(number);
            k_re.setK_reStatus(1);
            K_reService k_reService = new K_reService();
            int reResult = k_reService.updateStatusById(k_re);
            if (reResult > 0) {
                K_info k_info = new K_info();
                k_info.setK_id(Integer.parseInt(k_infoId));
                K_infoService k_infoService = new K_infoService();
                Map<String, Object> map1 = k_infoService.query(k_info);
                if (type.equalsIgnoreCase("release")) {
                    request.setAttribute("evaluate", "evRelease");
                } else if (type.equalsIgnoreCase("accept")) {
                    request.setAttribute("evaluate", "evAccept");
                }
                request.setAttribute("mapInfo", map1);
                request.setAttribute("done", "操作成功！");
                return "message";
            } else {
                request.setAttribute("msg", "操作失败，请重试！");
                return "message";
            }
        } else {
            request.setAttribute("msg", "操作失败，请重试！");
            return "message";
        }
    }

    public void listToJson(List<Map<String, Object>> list, HttpServletResponse response) throws IOException {
        JsonCommon jsonCommon = new JsonCommon();
        String data = jsonCommon.getJsonString(list);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.flush();
        out.write(data);
        out.flush();
        out.close();
    }

    @RequestMapping("/chat")
    public String chat(HttpServletRequest request) {
        String k_id = request.getParameter("k_id");
        K_info k_info = new K_info();
        k_info.setK_id(Integer.parseInt(k_id));
        K_infoService k_infoService = new K_infoService();
        Map<String, Object> mapInfo = k_infoService.query(k_info);
        HtmlCommon htmlCommon = new HtmlCommon();
        HttpSession session = htmlCommon.getSession();
        Map<String, Object> mapMyInfo = (Map<String, Object>) session.getAttribute("k_info");
        request.setAttribute("mapInfo", mapInfo);
        request.setAttribute("mapMyInfo", mapMyInfo);
        session.setAttribute("status",0);
        return "chat";
    }

    @RequestMapping("/chatMessage")
    public void chatMessage(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String k_chatOtherId = request.getParameter("k_chatOtherId");
        String k_chatMyId = request.getParameter("k_chatMyId");

        K_chat k_chat = new K_chat();
        k_chat.setK_chatOtherId(Integer.parseInt(k_chatOtherId));
        k_chat.setK_chatMyId(Integer.parseInt(k_chatMyId));
        K_chatService k_chatService = new K_chatService();
        List<Map<String,Object>> listMessage = k_chatService.queryMine(k_chat);
        List<Map<String,Object>> list = new ArrayList<>();
        for (int i = listMessage.size() - 1;i >= 0;i--){
            list.add(listMessage.get(i));
        }
        listToJson(list,response);
    }

}
