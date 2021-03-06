package com.springmvc.service;

import com.springmvc.dao.K_reDAO;
import com.springmvc.model.K_re;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/5.
 */
public class K_reService {

    K_reDAO k_reDAO = new K_reDAO();

    public int delete(K_re k_re){
        int result = -1;
        result = k_reDAO.delete(k_re);
        return result;
    }

    public int add(K_re k_re){
        int result = -1;
        result = k_reDAO.add2(k_re);

        return result;
    }

    public Map<String,Object> queryLast(){
        Map<String,Object> map = k_reDAO.queryLast();

        return map;
    }

    public List<Map<String,Object>> queryAll(){
        List<Map<String,Object>> list = k_reDAO.queryAll();
        return list;
    }

    public List<Map<String,Object>> queryAllById(K_re k_re){
        List<Map<String,Object>> list = k_reDAO.queryAllById(k_re);
        return list;
    }

    public Map<String,Object> queryDetail(K_re k_re){
        Map<String,Object> map1 = k_reDAO.queryDetail(k_re);

        return map1;
    }

    public int updateStatusById(K_re k_re){
        int result = -1;
        result = k_reDAO.updateStatusById(k_re);

        return result;
    }

    public Map<String,Object> queryById(K_re k_re){
        Map<String,Object> map1 = k_reDAO.queryById(k_re);

        return map1;
    }

    public List<Map<String,Object>> queryByInfoId(K_re k_re){
        List<Map<String,Object>> list = k_reDAO.queryByInfoId(k_re);
        return list;
    }
}
