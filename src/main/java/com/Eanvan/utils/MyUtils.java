package com.Eanvan.utils;

import org.apache.commons.codec.digest.DigestUtils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class MyUtils {

    /*当出现高并发的时候用对应的线程去处理时间的格式问题，防止出现时间混乱*/
    static final ThreadLocal<SimpleDateFormat> dateFormat =
            ThreadLocal.withInitial(() -> new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"));

    //加载配置文件
    public static final Properties properties = new Properties();
    protected static final String RESOURCE_PATH = "/resource/";

    static {
        try {
            properties.load(MyUtils.class.getClassLoader().getResourceAsStream("Eanvan.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String formateDate(Date date) {
        return dateFormat.get().format(date);
    }

    public static String encodeByMD5(String string) {
        try {
            if (string == null) {
                return "";
            }
            return DigestUtils.md5Hex(string);
        } catch (Exception e) {
            throw new RuntimeException("MD5加密错误:" + e.getMessage(), e);
        }
    }

    public static String getSavePath() {
        return properties.getProperty("dataSave.path");
    }

    /*返回用户存储的真实路径*/
    public static String getRealUserDataPath() {
        return properties.getProperty("dataSave.path") + properties.get("userData.path");
    }

    public static String getRealPostPicPath(){
        return properties.getProperty("dataSave.path") + properties.get("postData.path");
    }

    /*返回用于显示的文件虚拟路径*/
    public static String getVirtualUserDataPath() {
        return RESOURCE_PATH + properties.get("userData.path");
    }

    public static String getVirtualPostPicPath(){
        return RESOURCE_PATH + properties.get("postData.path");
    }
}
