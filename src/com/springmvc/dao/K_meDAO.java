package com.springmvc.dao;

import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_me;

/**
 * Created by lenovo on 2017/10/7.
 */
public class K_meDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    public int add(K_me k_me){
        String sql = "INSERT INTO k_me(k_meWarn,k_me_myId,k_meTime,k_me_otherId,k_meStatus,k_me_reId,k_meOtherWarn)VALUES(?,?,?,?,?,?,?)";
        int result = -1;
        Object[] objects = new Object[7];
        objects[0] = k_me.getK_meWarn();
        objects[1] = k_me.getK_me_myId();
        objects[2] = k_me.getK_meTime();
        objects[3] = k_me.getK_me_otherId();
        objects[4] = k_me.getK_meStatus();
        objects[5] = k_me.getK_me_reId();
        objects[6] = k_me.getK_meOtherWarn();
        result = jdbcUtils.update(sql,objects);

        return result;
    }
}
