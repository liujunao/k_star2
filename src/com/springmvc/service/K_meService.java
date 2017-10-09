package com.springmvc.service;

import com.springmvc.dao.K_meDAO;
import com.springmvc.model.K_me;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/7.
 */
public class K_meService {

    K_meDAO k_meDAO = new K_meDAO();

    public int add(K_me k_me){
        int result = -1;
        result = k_meDAO.add(k_me);
        return result;
    }

    public int updateGet(K_me k_me){
        int result = -1;
        result = k_meDAO.updateGet(k_me);

        return result;
    }

    public int updatePast(K_me k_me){
        int result = -1;
        result = k_meDAO.updatePast(k_me);

        return result;
    }

    public Map<String,Object> queryByNumber(K_me k_me){
        Map<String,Object> map1 = k_meDAO.queryByNumber(k_me);

        return map1;
    }

    public List<Map<String,Object>> queryMine(K_me k_me){
        List<Map<String,Object>> list = k_meDAO.queryMine(k_me);

        return list;
    }

}
