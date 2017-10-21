package com.springmvc.dao;

import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_chat;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/10/13.
 */
public class K_chatDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    public int add(K_chat k_chat){
        String sql = "INSERT INTO k_chat(k_chatMyId,k_chatMyName,k_chatOtherId,k_chatOtherName,k_chatMessage,k_chatTime)" +
                "VALUES(?,?,?,?,?,?)";
        int result = -1;
        Object[] objects = new Object[6];
        objects[0] = k_chat.getK_chatMyId();
        objects[1] = k_chat.getK_chatMyName();
        objects[2] = k_chat.getK_chatOtherId();
        objects[3] = k_chat.getK_chatOtherName();
        objects[4] = k_chat.getK_chatMessage();
        objects[5] = k_chat.getK_chatTime();
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    public List<Map<String,Object>> queryMine(K_chat k_chat){
        String sql = "SELECT * FROM k_chat WHERE (k_chatMyId = ? AND k_chatOtherId = ?) OR (k_chatMyId = ? AND k_chatOtherId = ?)";
        Object[] objects = new Object[4];
        objects[0] = k_chat.getK_chatMyId();
        objects[1] = k_chat.getK_chatOtherId();
        objects[2] = k_chat.getK_chatOtherId();
        objects[3] = k_chat.getK_chatMyId();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);

        return list;
    }

}
