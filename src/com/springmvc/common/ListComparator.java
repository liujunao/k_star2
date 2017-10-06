package com.springmvc.common;

import com.springmvc.kdHelper.KDModel;

import java.util.Comparator;

/**
 * Created by lenovo on 2017/10/5.
 */
public class ListComparator implements Comparator {

    @Override
    public int compare(Object o1, Object o2) {
        int flag = 0;
        if (o1 != null && o2 != null) {
            KDModel kdModel = (KDModel) o1;
            KDModel kdModel2 = (KDModel) o1;
            flag = kdModel.getTime().compareTo(kdModel2.getTime());
        }
        return flag;
    }

}
