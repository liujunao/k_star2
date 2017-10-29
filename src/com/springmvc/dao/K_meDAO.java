package com.springmvc.dao;

import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_me;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/7.
 */
public class K_meDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    public int delete(K_me k_me){
        int result = -1;
        String sql = "DELETE FROM k_me WHERE k_me_reId = ?";
        Object[] objects = new Object[1];
        objects[0] = k_me.getK_me_reId();
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public int add(K_me k_me){
        String sql = "INSERT INTO k_me(k_meWarn,k_me_myId,k_me_myUsername,k_meTime,k_meStatus,k_meRealName,k_meCode,k_meMoney," +
                "k_meAddress,k_me_reId,k_mePhone,k_meText)VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        int result = -1;
        Object[] objects = new Object[12];
        objects[0] = k_me.getK_meWarn();
        objects[1] = k_me.getK_me_myId();
        objects[2] = k_me.getK_me_myUsername();
        objects[3] = k_me.getK_meTime();
        objects[4] = k_me.getK_meStatus();
        objects[5] = k_me.getK_meRealName();
        objects[6] = k_me.getK_meCode();
        objects[7] = k_me.getK_meMoney();
        objects[8] = k_me.getK_meAddress();
        objects[9] = k_me.getK_me_reId();
        objects[10] = k_me.getK_mePhone();
        objects[11] = k_me.getK_meText();

        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public int updateGet(K_me k_me){
        String sql = "UPDATE k_me SET k_me_otherId=?,k_meTime=?,k_meStatus=?," +
                "k_meWarn=?,k_meOtherWarn=?,k_me_otherUsername = ? WHERE k_me_reId=?";
        Object[] objects = new Object[7];
        objects[0] = k_me.getK_me_otherId();
        objects[1] = k_me.getK_meTime();
        objects[2] = k_me.getK_meStatus();
        objects[3] = k_me.getK_meWarn();
        objects[4] = k_me.getK_meOtherWarn();
        objects[5] = k_me.getK_me_otherUsername();
        objects[6] = k_me.getK_me_reId();
        int result = -1;
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public int updateStatus(K_me k_me){
        String sql = "UPDATE k_me SET k_meStatus=? WHERE k_me_reId=?";
        int result = -1;
        Object[] objects = new Object[2];
        objects[0] = k_me.getK_meStatus();
        objects[1] = k_me.getK_me_reId();
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public int updatePast(K_me k_me){
        String sql = "UPDATE k_me SET k_meStatus=?,k_meWarn=? WHERE k_me_number=?";
        Object[] objects = new Object[3];
        objects[0] = k_me.getK_meStatus();
        objects[1] = k_me.getK_meWarn();
        objects[2] = k_me.getK_me_number();
        int result = -1;
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public Map<String,Object> queryByNumber(K_me k_me){
        String sql = "SELECT * FROM k_me WHERE k_me_reId=?";
        Object[] objects = new Object[1];
        objects[0] = k_me.getK_me_reId();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        Map<String,Object> map1 = list.get(0);

        return map1;
    }

    public List<Map<String,Object>> queryMine(K_me k_me){
        String sql = "SELECT * FROM k_me WHERE k_me_myId = ? OR k_me_otherId = ?";
        Object[] objects = new Object[2];
        objects[0] = k_me.getK_me_myId();
        objects[1] = k_me.getK_me_otherId();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);

        return list;
    }

}
