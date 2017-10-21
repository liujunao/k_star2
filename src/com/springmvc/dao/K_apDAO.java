package com.springmvc.dao;

import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_ap;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/21.
 */
public class K_apDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    public int add(K_ap k_ap){
        String sql = "INSERT INTO k_ap(k_apGrade1,k_apGrade2,k_apGrade3,k_apInfoId,k_apText)VALUES(?,?,?,?,?)";
        int result = -1;
        Object[] objects = new Object[5];
        objects[0] = k_ap.getK_apGrade1();
        objects[1] = k_ap.getK_apGrade2();
        objects[2] = k_ap.getK_apGrade3();
        objects[3] = k_ap.getK_apInfoId();
        objects[4] = k_ap.getK_apText();
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public List<Map<String,Object>> queryAllById(K_ap k_ap){
        String sql = "SELECT * FROM k_ap WHERE k_apInfoId = ?";
        Object[] objects = new Object[1];
        objects[0] = k_ap.getK_apInfoId();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);

        return list;
    }
}
