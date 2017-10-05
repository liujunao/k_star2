package com.springmvc.kdHelper;

import java.util.List;

/**
 * Created by lenovo on 2017/9/24.
 */
public abstract class KDBase {

    public abstract String getContent(String num,String type);

    public abstract List<KDModel>getData(String num,String type);
}
