package com.springmvc.kdHelper.model;

import java.util.List;


public class Root{

    private String message;
    private String nu;
    private String ischeck;
    private String condition;
    private String com;
    private String status;
    private String state;
    private List<DataItem> data;
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public String getNu() {
        return nu;
    }
    public void setNu(String nu) {
        this.nu = nu;
    }
    public String getIscheck() {
        return ischeck;
    }
    public void setIscheck(String ischeck) {
        this.ischeck = ischeck;
    }
    public String getCondition() {
        return condition;
    }
    public void setCondition(String condition) {
        this.condition = condition;
    }
    public String getCom() {
        return com;
    }
    public void setCom(String com) {
        this.com = com;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public List<DataItem> getData() {
        return data;
    }
    public void setData(List<DataItem> data) {
        this.data = data;
    }

}