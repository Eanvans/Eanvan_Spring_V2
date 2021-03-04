package com.Eanvan.service;

import com.Eanvan.async.MailTask;
import com.Eanvan.async.SaveImageTask;
import com.Eanvan.mapper.PostMapper;
import com.Eanvan.mapper.UserMapper;
import com.Eanvan.model.Info;
import com.Eanvan.model.PostAttachments;
import com.Eanvan.model.User;
import com.Eanvan.utils.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.io.IOException;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private TaskExecutor taskExecutor;
    @Autowired
    private JavaMailSender javaMailSender;


    public User selectUserByUid(int uid) {
        return userMapper.selectUserByUid(uid);
    }

    public void uploadUserHeadImg(byte[] bytes, String remoteFileName, Integer uid) throws IOException {
        //图片数据存储到指定位置，并将地址存储到数据库中
        taskExecutor.execute(new SaveImageTask(bytes, MyUtils.getRealUserDataPath(), remoteFileName));
        User user = new User();
        user.setUid(uid);
        user.setHeadUrl(MyUtils.getVirtualUserDataPath() + remoteFileName);
        userMapper.updateUserHeadUrl(user);
    }

    public void record(StringBuffer requestURL, String contextPath, String remoteAddr) {
        Info info = new Info();
        info.setRequestUrl(requestURL.toString());
        info.setContextPath(contextPath);
        info.setRemoteAddr(remoteAddr);
        userMapper.insertInfo(info);
    }

    public List<User> listUserByTime() {
        return userMapper.listUserByTime();
    }

    public List<User> listUserByHot() {
        return userMapper.listUserByHot();
    }

    /**
     * 用于区分两个uid之前的不同，包括了当前浏览的uid以及用户自身的uid
     *
     * @param sessionUid 表示当前用户的 uid
     * @param uid        表示浏览主页的 uid
     * @return
     */
    public User getProfile(int sessionUid, int uid) {
        //如果浏览的是别人的主页,则增加主页浏览数
        if (sessionUid != uid) {
            userMapper.updateScanCount(uid);
        }
        User user = userMapper.selectUserByUid(uid);
        //设置获赞数，关注数，粉丝数 user Jedis
        /*
         Jedis jedis = jedisPool.getResource();
        user.setFollowCount((int)(long)jedis.scard(uid+":follow"));
        user.setFollowerCount((int)(long)jedis.scard(uid+":fans"));
        String likeCount = jedis.hget("vote",uid+"");
        if(likeCount==null){
            user.setLikeCount(0);
        }else {
            user.setLikeCount(Integer.valueOf(likeCount));
        }

        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
         */
        return user;
    }

    public boolean getFollowStatus(int sessionUid, int uid) {
       /* Jedis jedis = jedisPool.getResource();
        boolean following = jedis.sismember(sessionUid + ":follow", String.valueOf(uid));
        if (jedis != null) {
            jedisPool.returnResource(jedis);
        }
        return following;*/
        //使用jedis的地方暂时注释
        return false;
    }

    public User getEditInfo(int uid) {
        return userMapper.selectEditInfo(uid);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    public String updatePassword(String password, String newPassword, String rePassword, Integer uid) {
        String oldPassword = userMapper.selectPasswordByUid(uid);
        //这一步的判断也可以使用js的Ajax请求进行覆盖与替换，节约服务器程序的资源
        if(!oldPassword.equals(password)){
            return "原密码输入错误~";
        }

        if(newPassword.length()<6 ||newPassword.length()>20){
            return "新密码长度要在6~20之间~";
        }

        if(!newPassword.equals(rePassword)){
            return "新密码两次输入不一致~";
        }

        userMapper.updatePassword(newPassword,uid);
        return "ok";
    }

    /**
     * 忘记密码的选项暂时还有一些疑问，主要出在前后关系上
     * @param email
     */
    public void forgetPassword(String email) {
        String verifyCode = userMapper.selectVerifyCode(email);
        System.out.println("verifyCode:"+verifyCode);
        //发送邮件
        taskExecutor.execute(new MailTask(verifyCode,email,javaMailSender,2));
    }
}
