package com.springmvc.model;

import java.util.Date;

/**
 * Created by lenovo on 2017/10/1.
 */
public class K_info {

    private int k_id;
    private String k_username;
    private String k_password;
    private String k_phone;
    private String k_qq;
    private String k_weChat;
    private String k_email;
    private int k_gender;
    private int k_status;
    private String k_emailValidate;
    private Date k_registerTime;

    public int getK_id() {
        return k_id;
    }

    public void setK_id(int k_id) {
        this.k_id = k_id;
    }

    public String getK_username() {
        return k_username;
    }

    public void setK_username(String k_username) {
        this.k_username = k_username;
    }

    public String getK_password() {
        return k_password;
    }

    public void setK_password(String k_password) {
        this.k_password = k_password;
    }

    public String getK_phone() {
        return k_phone;
    }

    public void setK_phone(String k_phone) {
        this.k_phone = k_phone;
    }

    public String getK_qq() {
        return k_qq;
    }

    public void setK_qq(String k_qq) {
        this.k_qq = k_qq;
    }

    public String getK_weChat() {
        return k_weChat;
    }

    public void setK_weChat(String k_weChat) {
        this.k_weChat = k_weChat;
    }

    public String getK_email() {
        return k_email;
    }

    public void setK_email(String k_email) {
        this.k_email = k_email;
    }

    public int getK_gender() {
        return k_gender;
    }

    public void setK_gender(int k_gender) {
        this.k_gender = k_gender;
    }

    public int getK_status() {
        return k_status;
    }

    public void setK_status(int k_status) {
        this.k_status = k_status;
    }

    public String getK_emailValidate() {
        return k_emailValidate;
    }

    public void setK_emailValidate(String k_emailValidate) {
        this.k_emailValidate = k_emailValidate;
    }

    public Date getK_registerTime() {
        return k_registerTime;
    }

    public void setK_registerTime(Date k_registerTime) {
        this.k_registerTime = k_registerTime;
    }
}
