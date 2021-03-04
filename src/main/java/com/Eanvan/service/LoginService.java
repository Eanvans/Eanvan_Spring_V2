package com.Eanvan.service;

import com.Eanvan.mapper.UserMapper;
import com.Eanvan.model.User;
import com.Eanvan.utils.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class LoginService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private TaskExecutor taskExecutor;

    //登录
    public Map<String, Object> login(User user) {
        Map<String, Object> map = new HashMap<>();
        /*user.setPassword(MyUtils.encodeByMD5(user.getPassword()));*/
        Integer uid = userMapper.selectUserByUserNameAndPassword(user.getUsername(), user.getPassword());
        if (uid == null) {
            map.put("result", "N");
            map.put("error", "用户名或密码错误~");
            return map;
        }
        map.put("result", "Y");
        map.put("uid", uid + "");

        User user1 = userMapper.selectUserByUid(uid);

        map.put("headUrl",user1.getHeadUrl());
        map.put("root",user1.getRoot() + "");
        //可以尝试持久化用户头像的数据


        /*if (Resultuser.getNickName() != null || Resultuser.getNickName() != "" || Resultuser.getNickName().length() > 0)
            map.put("nickName", Resultuser.getNickName());
        else
            map.put("uid", Resultuser.getUid());*/
        return map;
    }


    //注册
    public String register(User user, String password) {
        //校验邮箱格式
        Pattern p = Pattern.compile("^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.]){1,2}[A-Za-z\\d]{2,5}$");
         /*  Matcher m = p.matcher(user.getEmail());
        if (!m.matches())
            return "邮箱格式不正确!";*/
        //校验密码长度
        p = Pattern.compile("^\\w{6,20}$");
        Matcher m = p.matcher(user.getPassword());
        if (!m.matches())
            return "密码长度要在6-20位之间";
        user.setJoinTime(MyUtils.formateDate(new Date()));
        /*user.setPassword(MyUtils.encodeByMD5(user.getPassword()));*/
        userMapper.InsertUser(user);
        return "ok";
    }

    public boolean validateUsername(String username) {
        int isEmpty = userMapper.selectUserByUsername(username);
        return !(isEmpty == 0);
    }
}
