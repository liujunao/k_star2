package com.springmvc.common;

/**
 * Created by lenovo on 2017/10/4.
 */
public class TypeCommon {

    public String typeToString(String type) {
        String result = "";
        if (type.equals("zhongtong")) {
            result = "中通";
        }
        if (type.equals("yunda")) {
            result = "韵达";
        }
        if (type.equals("yuantong")) {
            result = "圆通";
        }
        if (type.equals("huitongkuaidi")) {
            result = "百世快递";
        }
        if (type.equals("shentong")) {
            result = "申通";
        }
        if (type.equals("wanxiangwuliu")) {
            result = "万象物流";
        }
        if (type.equals("ems")){
            result = "EMS物流";
        }
        return result;
    }

}
