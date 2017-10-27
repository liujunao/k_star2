package com.springmvc.service;

import com.springmvc.dao.K_exDAO;
import com.springmvc.model.K_ex;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/4.
 */
public class K_exService {

    K_exDAO k_exDAO = new K_exDAO();

    public int add(K_ex k_ex){
        int result = -1;
        result = k_exDAO.add(k_ex);

        return result;
    }

    public List<Map<String,Object>> query(K_ex k_ex){
        List<Map<String,Object>> list = k_exDAO.query(k_ex);

        return list;
    }

    public List<Map<String,Object>>queryAllByInfoId(K_ex k_ex){
        List<Map<String,Object>> list = k_exDAO.queryAllByInfoId(k_ex);

        return list;
    }
}
