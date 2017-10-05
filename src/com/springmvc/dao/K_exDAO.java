package com.springmvc.dao;

import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_ex;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/4.
 */
public class K_exDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    public int add(K_ex k_ex){
        String sql = "INSERT INTO k_ex(k_infoId,k_time,k_context,k_number,k_type,k_status)VALUES(?,?,?,?,?,?)";
        int result = -1;
        Object[] objects = new Object[6];
        objects[0] = k_ex.getK_infoId();
        objects[1] = k_ex.getK_time();
        objects[2] = k_ex.getK_context();
        objects[3] = k_ex.getK_number();
        objects[4] = k_ex.getK_type();
        objects[5] = k_ex.getK_status();
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public List<Map<String,Object>> queryByNumber(K_ex k_ex){
        String sql = "SELECT k_time FROM k_ex WHERE k_number = ?";
        Object[] objects = new Object[1];
        objects[0] = k_ex.getK_number();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);

        return list;
    }

    public List<Map<String,Object>> queryAllByInfoId(K_ex k_ex){
        String sql = "SELECT * FROM k_ex WHERE k_infoId = ?";
        Object[] objects = new Object[1];
        objects[0] = k_ex.getK_infoId();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);

        return list;
    }
}
