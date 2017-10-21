package com.springmvc.service;

import com.springmvc.dao.K_chatDAO;
import com.springmvc.model.K_chat;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/13.
 */
public class K_chatService {

    K_chatDAO k_chatDAO = new K_chatDAO();

    public int add(K_chat k_chat){
        int result = -1;
        result = k_chatDAO.add(k_chat);

        return result;
    }

    public List<Map<String,Object>> queryMine(K_chat k_chat){
        List<Map<String,Object>> list = k_chatDAO.queryMine(k_chat);

        return list;
    }
}
