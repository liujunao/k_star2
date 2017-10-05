package com.springmvc.service;

import com.springmvc.dao.K_infoDAO;
import com.springmvc.model.K_info;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/2.
 */
public class K_infoService {

    K_infoDAO k_infoDAO = new K_infoDAO();

    public int add(K_info k_info){
        int result = -1;
        result = k_infoDAO.add(k_info);

        return result;
    }

    public int deleteByEmail(K_info k_info){
        int result = -1;
        result = k_infoDAO.deleteByEmail(k_info);

        return result;
    }

    public int updatePassword(K_info k_info){
        int result = -1;
        result = k_infoDAO.updatePassword(k_info);

        return result;
    }

    public int updateSupplement(K_info k_info){
        int result = -1;
        result = k_infoDAO.updateSupplement(k_info);

        return result;
    }

    public Map<String,Object>query(K_info k_info){
        Map<String,Object> map = null;
        map = k_infoDAO.query(k_info);

        return map;
    }

    public Map<String,Object>queryByEmail(String email){
        Map<String,Object> map = null;
        map = k_infoDAO.queryByEmail(email);

        return map;
    }

    public Map<String,Object>queryByLoginName(K_info k_info){
        Map<String,Object> map = null;
        map = k_infoDAO.queryByLoginName(k_info);

        return map;
    }

    public List<Map<String,Object>>queryEmail(){
        return k_infoDAO.queryEmail();
    }

    public int login(K_info k_info){
        int result = -1;
        result = k_infoDAO.login(k_info);

        return result;
    }

    public int retrieve(K_info k_info){
        int result = -1;
        result = k_infoDAO.retrieve(k_info);

        return result;
    }
}
