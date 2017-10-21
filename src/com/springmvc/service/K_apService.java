package com.springmvc.service;

import com.springmvc.dao.K_apDAO;
import com.springmvc.model.K_ap;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/21.
 */
public class K_apService {

    K_apDAO k_apDAO = new K_apDAO();

    public int add(K_ap k_ap){
        int result = -1;
        result = k_apDAO.add(k_ap);

        return result;
    }

    public List<Map<String,Object>> queryAllById(K_ap k_ap){
        List<Map<String,Object>> list = k_apDAO.queryAllById(k_ap);

        return list;
    }
}
