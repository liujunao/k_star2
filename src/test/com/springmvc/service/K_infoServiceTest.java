package com.springmvc.service;

import com.springmvc.dao.K_infoDAO;
import com.springmvc.db.JdbcUtils;
import com.springmvc.model.K_info;
import org.junit.Test;

import java.sql.SQLException;

/**
 * Created by lenovo on 2017/10/2.
 */
public class K_infoServiceTest {

    K_infoService k_infoService = new K_infoService();
    JdbcUtils jdbcUtils = new JdbcUtils();

    @Test
    public void test() throws SQLException {
        System.out.println(jdbcUtils.getConnection());
    }

    @Test
    public void queryByEmail() throws Exception {
        K_info k_info = new K_info();
        K_infoDAO k_infoDAO = new K_infoDAO();
        k_info.setK_id(1);
//        System.out.println(k_infoDAO.queryList(k_info));
        System.out.println(k_infoService.queryByEmail("12315@qq.com"));
    }

    @Test
    public void testString(){
        String a = "aa";
        String b = new String("aa");
        System.out.println(a == b);
    }
}