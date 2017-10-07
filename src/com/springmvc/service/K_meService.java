package com.springmvc.service;

import com.springmvc.dao.K_meDAO;
import com.springmvc.model.K_me;

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
}
