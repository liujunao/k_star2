package com.springmvc.controller;

import com.springmvc.common.HtmlCommon;
import com.springmvc.common.JsonCommon;
import com.springmvc.common.TypeCommon;
import com.springmvc.kdHelper.DataList;
import com.springmvc.kdHelper.KDModel;
import com.springmvc.model.K_ex;
import com.springmvc.model.K_info;
import com.springmvc.model.K_re;
import com.springmvc.service.K_exService;
import com.springmvc.service.K_infoService;
import com.springmvc.service.K_reService;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
        System.out.println(num);
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
        System.out.println(num);
        K_ex k_ex = new K_ex();
        k_ex.setK_number(num);
        K_exService k_exService = new K_exService();
        List<Map<String, Object>> list = k_exService.queryByNumber(k_ex);
        if (list != null) {
            JsonCommon jsonCommon = new JsonCommon();
            String result = jsonCommon.getJsonString(list);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.flush();
            out.write(result);
            out.flush();
            out.close();
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
        JsonCommon jsonCommon = new JsonCommon();
        String data = jsonCommon.getJsonString(list1);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(data);
        out.flush();
        out.close();
    }

    @RequestMapping("/release")
    public String release(K_re k_re, HttpServletRequest request) throws UnsupportedEncodingException {

        request.setCharacterEncoding("utf-8");
        K_reService k_reService = new K_reService();
        int result = -1;
        result = k_reService.add(k_re);
        if (result > 0) {
            request.setAttribute("message", "任务发布成功！");
            request.setAttribute("k_re", k_re);
            return "release";
        } else {
            request.setAttribute("msg", "任务发布失败，请重新发布！");
            return "release";
        }
    }

    @RequestMapping("/fail")
    public String toFail(HttpServletRequest request){
        String message = request.getParameter("msg");
        request.setAttribute("msg",message);
        return "fail";
    }

    @RequestMapping("/forumAll")
    public void forumAll(HttpServletResponse response) throws IOException {
        K_reService k_reService = new K_reService();
        List<Map<String,Object>> list = k_reService.queryAll();
        System.out.println(list);
        JsonCommon jsonCommon = new JsonCommon();
        String data = jsonCommon.getJsonString(list);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.flush();
        out.write(data);
        out.flush();
        out.close();
    }

    @RequestMapping("/forumDetail")
    public String forumDetail(HttpServletRequest request){
        String number = request.getParameter("number");
        K_reService k_reService = new K_reService();
        K_re k_re = new K_re();
        k_re.setK_reNumber(number);
        Map<String,Object> mapDetail = k_reService.queryDetail(k_re);
        if (mapDetail != null){
            request.setAttribute("mapDetail",mapDetail);
            request.setAttribute("message","查看成功");
            return "forum";
        }else {
            request.setAttribute("msg","查看失败，请重试！");
            return "forum";
        }
    }
}
