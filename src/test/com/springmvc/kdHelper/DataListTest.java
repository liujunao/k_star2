package com.springmvc.kdHelper;

import org.junit.Test;

import java.util.List;

/**
 * @author lenovo
 * @date 2018/10/29
 */
public class DataListTest {
    DataList dataList = new DataList();
    @Test
    public void getData() throws Exception {
        List<KDModel> list = dataList.getData("640006627091","zhongtong");
        for (KDModel model : list){
            System.out.println(model);
        }
    }

}