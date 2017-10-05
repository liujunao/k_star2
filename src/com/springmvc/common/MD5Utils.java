package com.springmvc.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by lenovo on 2017/10/1.
 */
public class MD5Utils {

    //将源字符使用MD5加密为字节数组
    public byte[] encode2bytes(String source){
        byte[] bytes = null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(source.getBytes("UTF-8"));
            bytes = messageDigest.digest();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return bytes;
    }

    //将源字符使用 MD5 加密为32位16进制数
    public String encode2hex(String source){
        byte[] bytes = encode2bytes(source);
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0;i < bytes.length;i++){
            String hex = Integer.toHexString(0xff & bytes[i]);

            if (hex.length() == 1){
                stringBuffer.append('0');
            }
            stringBuffer.append(hex);
        }
        return stringBuffer.toString();
    }

    //验证字符是否匹配
    public boolean emailValidate(String unknown,String okHex){
        return okHex.equals(encode2hex(unknown));
    }
}
