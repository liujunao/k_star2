package com.springmvc.common;

import java.util.UUID;

/**
 * Created by lenovo on 2017/10/2.
 */
public class UUIDUtils {

    public String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
