package com.Eanvan.mapper;

import com.Eanvan.model.Info;
import com.Eanvan.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserMapper {
    //用户登录
    Integer selectUserByUserNameAndPassword(@Param("username") String username,@Param("password")  String password);

    //查询用户详细信息
    User selectUserByUid(int uid);

    //添加新用户
    void InsertUser(User user);

    //更新用户头像图片地址信息
    void updateUserHeadUrl(User user);

    int selectUserByUsername(String username);

    void insertInfo(Info info);

    List<User> listUserByTime();

    //当前根据用户的发帖量排序
    List<User> listUserByHot();

    void updateScanCount(Integer uid);

    User selectEditInfo(int uid);

    void updateUser(User user);

    String selectPasswordByUid(Integer uid);

    void updatePassword(@Param("newPassword")String newPassword,@Param("uid") Integer uid);

    String selectVerifyCode(String email);

    String selectUserHeadUrlByUid(int uid);
}
