package com.springmvc.dao;

import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_re;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/5.
 */
public class K_reDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    public int add2(K_re k_re){
        String sql = "INSERT INTO k_re(k_reNumber,k_reName,k_rePhone,k_reText,k_re_infoId,k_infoName,k_reStatus,k_reTime,k_re_puTime,k_reRealName,k_reCode,k_reMoney,k_reAddress)" +
                "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int result = -1;
        Object[] objects = new Object[13];
        objects[0] = k_re.getK_reNumber();
        objects[1] = k_re.getK_reName();
        objects[2] = k_re.getK_rePhone();
        objects[3] = k_re.getK_reText();
        objects[4] = k_re.getK_re_infoId();
        objects[5] = k_re.getK_infoName();
        objects[6] = k_re.getK_reStatus();
        objects[7] = k_re.getK_reTime();
        objects[8] = k_re.getK_re_puTime();
        objects[9] = k_re.getK_reRealName();
        objects[10] = k_re.getK_reCode();
        objects[11] = k_re.getK_reMoney();
        objects[12] = k_re.getK_reAddress();

        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public List<Map<String,Object>>queryAll(){
        String sql = "SELECT * FROM k_re";
        List<Map<String,Object>> list = jdbcUtils.query(sql,null);

        return list;
    }

    public Map<String,Object> queryDetail(K_re k_re){
        String sql = "SELECT * FROM k_re WHERE k_reId = ? OR k_reNumber = ?";
        Object[] objects = new Object[2];
        objects[0] = k_re.getK_reId();
        objects[1] = k_re.getK_reNumber();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        Map<String,Object> map1 = list.get(0);

        return map1;
    }

    public int updateStatusById(K_re k_re){
        String sql = "UPDATE k_re SET k_reStatus = ? WHERE k_reId = ?";
        int result = -1;
        Object[] objects = new Object[2];
        objects[0] = k_re.getK_reStatus();
        objects[1] = k_re.getK_reId();
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public Map<String,Object> queryById(K_re k_re){
        String sql = "SELECT * FROM k_re WHERE k_reId=?";
        Object[] objects = new Object[1];
        objects[0] = k_re.getK_reId();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        Map<String,Object> map1 = list.get(0);

        return map1;
    }

    public List<Map<String,Object>> queryByInfoId(K_re k_re){
        String sql = "SELECT * FROM k_re WHERE k_re_infoId = ?";
        Object[] objects = new Object[1];
        objects[0] = k_re.getK_re_infoId();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);

        return list;
    }

}
