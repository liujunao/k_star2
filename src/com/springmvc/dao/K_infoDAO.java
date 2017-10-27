package com.springmvc.dao;

import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_info;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/1.
 */
public class K_infoDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    public int add(K_info k_info) {
        int result = -1;
        String sql = "INSERT INTO k_info(k_username,k_password,k_phone,k_qq,k_weChat,k_email,k_gender,k_status,k_emailValidate,k_registerTime,k_money,k_address,k_name,k_tPhone)" +
                "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] objects = new Object[14];
        objects[0] = k_info.getK_username();
        objects[1] = k_info.getK_password();
        objects[2] = k_info.getK_phone();
        objects[3] = k_info.getK_qq();
        objects[4] = k_info.getK_weChat();
        objects[5] = k_info.getK_email();
        objects[6] = k_info.getK_gender();
        objects[7] = k_info.getK_status();
        objects[8] = k_info.getK_emailValidate();
        objects[9] = k_info.getK_registerTime();
        objects[10] = k_info.getK_money();
        objects[11] = k_info.getK_address();
        objects[12] = k_info.getK_name();
        objects[13] = k_info.getK_tPhone();

        result = jdbcUtils.update(sql, objects);

        return result;
    }

    public int deleteByEmail(K_info k_info) {
        int result = -1;
        String sql = "DELETE FROM k_info WHERE k_email = ?";
        Object[] objects = new Object[1];
        objects[0] = k_info.getK_email();

        result = jdbcUtils.update(sql, objects);

        return result;
    }

    public int updatePassword(K_info k_info){
        String sql = "UPDATE k_info SET k_password=? WHERE k_email= ?";
        Object[] objects = new Object[2];
        objects[0] = k_info.getK_password();
        objects[1] = k_info.getK_email();
        int result = -1;
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public int updateSupplement(K_info k_info){
        String sql = "UPDATE k_info SET k_username=?,k_phone=?,k_qq=?,k_weChat=?,k_email=?,k_tPhone=?,k_name=?,k_address=?,k_money=? WHERE k_id = " + k_info.getK_id();
        Object[] objects = new Object[9];
        objects[0] = k_info.getK_username();
        objects[1] = k_info.getK_phone();
        objects[2] = k_info.getK_qq();
        objects[3] = k_info.getK_weChat();
        objects[4] = k_info.getK_email();
        objects[5] = k_info.getK_tPhone();
        objects[6] = k_info.getK_name();
        objects[7] = k_info.getK_address();
        objects[8] = k_info.getK_money();
        int result = -1;

        result = jdbcUtils.update(sql,objects);
        return result;
    }

    public Map<String, Object> query(K_info k_info) {
        List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
        String sql = "SELECT * FROM k_info WHERE k_id = ?";
        Object[] objects = new Object[1];
        objects[0] = k_info.getK_id();
        list = jdbcUtils.query(sql, objects);
        map = list.get(0);
        return map;
    }

    public Map<String, Object> queryByEmail(String email) {
        List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
        String sql = "SELECT * FROM k_info WHERE k_email = ?";
        Object[] objects = new Object[1];
        objects[0] = email;
        list = jdbcUtils.query(sql, objects);
        map = list.get(0);
        return map;
    }

    public Map<String, Object> queryByLoginName(K_info k_info) {
        List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
        String sql = "SELECT * FROM k_info WHERE k_email = ? OR k_username = ?";
        Object[] objects = new Object[2];
        objects[0] = k_info.getK_email();
        objects[1] = k_info.getK_username();
        list = jdbcUtils.query(sql, objects);
        map = list.get(0);
        return map;
    }

    public List<Map<String, Object>> queryEmail() {
        String sql = "SELECT k_email FROM k_info";
        List<Map<String, Object>> list = null;

        list = jdbcUtils.query(sql, null);
        return list;
    }

    public int login(K_info k_info) {
        String sql = "SELECT * FROM k_info WHERE (k_username = ? OR k_email = ?) AND k_password = ?";
        int result = -1;
        Object[] objects = new Object[3];

        objects[0] = k_info.getK_username();
        objects[1] = k_info.getK_email();
        objects[2] = k_info.getK_password();
        List<Map<String, Object>> list = null;
        list = jdbcUtils.query(sql, objects);

        result = list.size();
        return result;
    }

    public int retrieve(K_info k_info){
        String sql = "SELECT * FROM k_info WHERE k_username = ? OR k_email = ?";
        int result = -1;
        Object[] objects = new Object[2];
        objects[0] = k_info.getK_username();
        objects[1] = k_info.getK_email();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);

        result = list.size();
        return result;
    }

    public int queryUsername(K_info k_info){
        String sql = "SELECT * FROM k_info WHERE k_username = ?";
        int result = -1;
        Object[] objects = new Object[1];
        objects[0] = k_info.getK_username();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        result = list.size();

        return result;
    }
}
