package com.springmvc.kdHelper;

import com.springmvc.common.XmlCommon;
import org.w3c.dom.Node;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/9/24.
 */
public class Test {

    public static void main(String[] args) throws Exception {
        String type = "zhongtong";
        String num = "452865312027";
        String xml = "D:\\workCode\\k_star\\src\\com\\springmvc\\config.xml";
        XmlCommon xmlCommon = new XmlCommon(xml);
        List<Map<String, Node>> list = xmlCommon.parseXml();
        for (int i = 1;i < list.size() - 1;i++){
            Map<String, Node> map = list.get(i);
            Node node = map.get("item");
            String stringType = xmlCommon.getAttributesValue(node,"type");
            String stringClass = xmlCommon.getAttributesValue(node,"class");
            if (stringType.equalsIgnoreCase(type)){
                Class clazz = Class.forName(stringClass);
                Object object = clazz.newInstance();
                KDBase kdBase = (KDBase) object;
                System.out.println(kdBase.getContent(num,type));
                System.out.println();
                List<KDModel>data = kdBase.getData(num,type);
                for (int j = 0;j < data.size();j++){
                    System.out.println(data.get(j).getContext());
                }
            }
        }
    }
}
