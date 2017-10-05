package com.springmvc.kdHelper;

import com.springmvc.common.HttpCommon;
import com.springmvc.common.JsonCommon;
import com.springmvc.kdHelper.model.Root;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2017/9/24.
 */
public class DataList extends KDBase {

    HttpCommon httpCommon = new HttpCommon();

    @Override
    public String getContent(String num,String type) {
        String result = "";
        String url = "http://www.kuaidi100.com/query?type=" + type + "&postid=" + num;
        result = httpCommon.getContentUrl(url, "utf-8");
        return result;
    }

    @Override
    public List<KDModel> getData(String num,String type) {
        List<KDModel> list = new ArrayList<>();
        JsonCommon jsonCommon = new JsonCommon();
        String json = getContent(num,type);
        Root model = jsonCommon.getObject(json, Root.class);
        KDModel kdModel = null;
        for (int i = 0; i < model.getData().size(); i++) {
            kdModel = new KDModel();
            kdModel.setTime(model.getData().get(i).getTime());
            kdModel.setContext(model.getData().get(i).getContext());
            kdModel.setLocation(model.getData().get(i).getLocation());
            list.add(kdModel);
        }
        return list;
    }
}
