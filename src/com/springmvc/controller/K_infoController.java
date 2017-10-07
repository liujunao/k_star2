package com.springmvc.controller;

import com.springmvc.common.*;
import com.springmvc.model.K_info;
import com.springmvc.service.K_infoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lenovo on 2017/10/2.
 */
@Controller
@RequestMapping("/user")
public class K_infoController {

    MD5Utils md5Utils = new MD5Utils();
    UUIDUtils uuidUtils = new UUIDUtils();
    String UUID = uuidUtils.getUUID();

    @RequestMapping("/register")
    public String register(K_info k_info, HttpServletRequest request) throws Exception {
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("register")) {
            String k_password2 = request.getParameter("k_password2");
            if (k_info.getK_username() == null || k_info.getK_username().length() < 4 || k_info.getK_username().length() > 18
                    || k_info.getK_username().indexOf(" ") > 0) {
                request.setAttribute("msg","用户名填写不正确");
                return "register";
            }
            String passwordRegular = "/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{6,18}$/";
            Pattern pattern = Pattern.compile(passwordRegular);
            Matcher passwordMatcher = pattern.matcher(k_info.getK_password());
            if (!k_info.getK_password().equalsIgnoreCase(k_password2) || k_info.getK_password().length() < 6 || k_info.getK_password().length() > 18
                    || passwordMatcher.lookingAt()) {
                request.setAttribute("msg","密码格式填写有误！");
                return "register";
            }
            K_infoService k_infoService = new K_infoService();
            int result = -1;
            DesUtils desUtils = new DesUtils();
            k_info.setK_password(desUtils.encrypt(k_info.getK_password()));
            k_info.setK_status(0);
            k_info.setK_emailValidate(md5Utils.encode2hex(k_info.getK_email()) + UUID);
            List<Map<String, Object>> list = k_infoService.queryEmail();
            Map<String, Object> map = null;
            for (int i = 0; i < list.size(); i++) {
                map = list.get(i);
                if (k_info.getK_email().equalsIgnoreCase((String) map.get("k_email"))) {
                    request.setAttribute("msg", "该邮箱已被注册");
                    return "register";
                }
            }
            result = k_infoService.add(k_info);
            if (result < 0) {
                request.setAttribute("msg","注册失败，请重新注册！");
                return "register";
            }
            processValidate(k_info.getK_email(), "register");
            request.setAttribute("msg", "请点击验证邮件完成验证！");
            return "fail";
        } else if (action.equalsIgnoreCase("activation")) {
            HtmlCommon htmlCommon = new HtmlCommon();
            String email = request.getParameter("email");
            String validateCode = request.getParameter("validateCode");
            K_infoService k_infoService = new K_infoService();
            Map<String, Object> informationList = k_infoService.queryByEmail(email);
            if (informationList != null) {
                if (Integer.parseInt(informationList.get("k_status").toString()) == 0) {
                    if (validateCode.equalsIgnoreCase(informationList.get("k_emailValidate").toString())) {
                        request.setAttribute("msg","注册成功！");
                        return "login";
                    } else {
                        request.setAttribute("msg", "激活码错误,请重新注册！");
                        K_info k_info1 = new K_info();
                        k_info1.setK_email(email);
                        k_infoService.deleteByEmail(k_info1);
                        return "register";
                    }
                } else {
                    request.setAttribute("msg", "激活码已过期");
                    K_info k_info1 = new K_info();
                    k_info1.setK_email(email);
                    k_infoService.deleteByEmail(k_info1);
                    return "register";
                }
            } else {
                K_info k_info1 = new K_info();
                k_info1.setK_email(email);
                k_infoService.deleteByEmail(k_info1);
                return "register";
            }
        }
        return "login";
    }

    @RequestMapping("/login")
    public String login1(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String loginName = request.getParameter("username");
        String password = request.getParameter("password");
        String validation = request.getParameter("validation");
        String sessionValidation = (String) request.getSession().getAttribute("sessionValidation");

        DesUtils desUtils = new DesUtils();
        K_info k_info = new K_info();
        K_infoService k_infoService = new K_infoService();
        k_info.setK_username(loginName);
        k_info.setK_email(loginName);
        k_info.setK_password(desUtils.encrypt(password));
        HtmlCommon htmlCommon = new HtmlCommon();
        if (!validation.equalsIgnoreCase(sessionValidation)) {
            request.setAttribute("msg","验证码填写有误");
            return "login";
        }
        int result = -1;
        result = k_infoService.login(k_info);
        if (result > 0) {
            k_info = new K_info();
            k_info.setK_email(loginName);
            k_info.setK_username(loginName);
            Map<String, Object> map = k_infoService.queryByLoginName(k_info);
            HttpSession session = htmlCommon.getSession();
            session.setAttribute("k_info", map);
            return "index";
        }else {
            request.setAttribute("msg","登录失败，请重新登录！");
            return "login";
        }
    }

    @RequestMapping("/revisePassword")
    public String revisePassword(HttpServletRequest request) throws Exception {

        String revise = request.getParameter("revise");
        String action = request.getParameter("action");
        K_infoService k_infoService = new K_infoService();

        if (revise.equalsIgnoreCase("page")) {
            request.setAttribute("revise", "first");
            return "retrieve";
        }

        if (revise.equalsIgnoreCase("count")) {
            String validation1 = (String) request.getSession().getAttribute("sessionValidation");
            System.out.println(validation1);
            String validation = (String) request.getAttribute("validation");
            if (!validation1.equalsIgnoreCase(validation)) {
                request.setAttribute("revise", "first");
                return "retrieve";
            }
            String loginName = request.getParameter("loginName");
            K_info k_info = new K_info();
            k_info.setK_username(loginName);
            k_info.setK_email(loginName);
            int result = -1;
            result = k_infoService.retrieve(k_info);
            if (result > 0) {
                request.setAttribute("revise", "email");
                return "retrieve";
            }
            //前台验证是否存在该用户
        }
        if (revise.equalsIgnoreCase("validateCode")) {
            String validation1 = (String) request.getSession().getAttribute("sessionValidation");
            System.out.println(validation1);
            String validation = (String) request.getAttribute("validation");
            if (!validation1.equalsIgnoreCase(validation)) {
                request.setAttribute("revise", "email");
                return "retrieve";
            }
            String email = request.getParameter("emailName");
            List<Map<String, Object>> list = k_infoService.queryEmail();
            Map<String, Object> map = null;
            for (int i = 0; i < list.size(); i++) {
                map = list.get(i);
                if (email.equalsIgnoreCase((String) map.get("k_email"))) {
                    HtmlCommon htmlCommon = new HtmlCommon();
                    HttpSession session = htmlCommon.getSession();
                    session.setAttribute("sessionEmail", email);
                    processValidate(email, "revisePassword");
                    request.setAttribute("msg", "请点击邮箱完成身份验证");
                    return "fail";
                }
            }
            //否则，前台验证是否存在该邮箱
        }
        if (action != null && action.equalsIgnoreCase("activation")) {
            String email = request.getParameter("email");
            String validationCode = request.getParameter("validateCode");
            if (validationCode.equalsIgnoreCase(md5Utils.encode2hex(email) + UUID)) {
                request.setAttribute("revise", "newPassword");
                return "retrieve";
            }
        }
        if (revise.equalsIgnoreCase("password")) {
            String validation1 = (String) request.getSession().getAttribute("sessionValidation");
            System.out.println(validation1);
            String validation = (String) request.getAttribute("validation");
            if (!validation1.equalsIgnoreCase(validation)) {
                request.setAttribute("revise", "newPassword");
                return "retrieve";
            }
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");

            String passwordRegular = "/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{6,18}$/";
            Pattern pattern = Pattern.compile(passwordRegular);
            Matcher passwordMatcher = pattern.matcher(password);
            if (!password.equalsIgnoreCase(password2) || password.length() < 6 || password.length() > 18
                    || passwordMatcher.lookingAt()) {
                return "retrieve";
            } else {
                String sessionEmail = (String) request.getSession().getAttribute("sessionEmail");
                K_info k_info = new K_info();
                DesUtils desUtils = new DesUtils();
                k_info.setK_email(sessionEmail);
                k_info.setK_password(desUtils.encrypt(password));
                int result = -1;
                result = k_infoService.updatePassword(k_info);
                if (result > 0) {
                    request.setAttribute("msg","密码修改成功！");
                    return "login";
                }
            }
        }
        return "redirect:/index.jsp";
    }

    public void processValidate(String email, String url) {
        StringBuffer stringBuffer = new StringBuffer("点击下面链接激活账号，24小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
        stringBuffer.append("<a href=\"http://localhost:8080/user/" + url + "?action=activation&email=");
        stringBuffer.append(email);
        stringBuffer.append("&validateCode=");
        stringBuffer.append(md5Utils.encode2hex(email) + UUID);
        stringBuffer.append("&revise=test\">http://localhost:8080/user/register?action=activation&email=");
        stringBuffer.append(email);
        stringBuffer.append("&validateCode=");
        stringBuffer.append(md5Utils.encode2hex(email) + UUID);
        stringBuffer.append("</a>");
        //发送邮件
        SendEmail sendEmail = new SendEmail();
        sendEmail.sendMail(email, stringBuffer.toString());
    }

    @RequestMapping("/validation")
    public void validate(HttpServletResponse response) throws IOException {
        Validation validation = new Validation();
        BufferedImage bufferedImage = validation.getBufferImage(120, 30);
        HtmlCommon htmlCommon = new HtmlCommon();
        HttpSession session = htmlCommon.getSession();
        session.setAttribute("sessionValidation", validation.getText());
        validation.output(bufferedImage, response.getOutputStream());
    }

    @RequestMapping("/validateUserName")
    public void validateUserName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HtmlCommon htmlCommon = new HtmlCommon();
        String loginName = htmlCommon.getParameter(request,"k_username");

        K_infoService k_infoService = new K_infoService();
        K_info k_info = new K_info();

        if (loginName != null && !loginName.equals("")){
            k_info.setK_username(loginName);
        }
        int result = -1;
        result = k_infoService.queryUsername(k_info);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        if (result > 0) {
            out.flush();
            out.write("1");
            out.flush();
            out.close();
        } else {
            out.flush();
            out.write("0");
            out.flush();
            out.close();
        }
    }

}