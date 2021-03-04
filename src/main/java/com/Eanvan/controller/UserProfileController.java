package com.Eanvan.controller;

import com.Eanvan.model.Post;
import com.Eanvan.model.User;
import com.Eanvan.service.PostService;
import com.Eanvan.service.UserService;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.util.Password;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * profile/toMyProfile
 * profile/toProfile
 * profile/toEditProfile
 * profile/editProfile
 * profile/updatePassword
 * profile/forgetPassword
 * profile/userCenter
 * profile/userMessage
 * profile/followList
 * profile/userPosts
 */
@Controller
@RequestMapping("/profile/")
public class UserProfileController {

    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;

    /**
     * 查看个人的主页
     *
     * @param model
     * @param session
     * @return C_profile的页面，使用同一个页面，
     * 但是使用 jsp中的判断进行区分
     */
    @RequestMapping("toMyProfile")
    public String toMyProfile(Model model, HttpSession session) {
        model.addAttribute("profile", "myProfile");
        Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
        User user = userService.getProfile(uid, uid);
        List<Post> postList = postService.getPostList(uid);
        model.addAttribute("user", user);
        model.addAttribute("postList", postList);
        return "C_profile";
    }


    /**
     * 前往别人的主页
     *
     * @param uid
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("toProfile")
    public String toProfile(int uid, Model model, HttpSession session) {
        //如果是自己的页面则跳转到个人主页
        Integer sessionUid = Integer.parseInt((String) session.getAttribute("uid"));
        if (uid == sessionUid) {
            return "redirect:toMyProfile";
        }
        model.addAttribute("profile", "profile");
        //判断是否关注用户
        boolean following = userService.getFollowStatus(sessionUid, uid);
        //获得用户信息
        User user = userService.getProfile(sessionUid, uid);
        //获得发帖列表
        List<Post> postList = postService.getPostList(uid);
        //向模型中添加数据
        model.addAttribute("following", following);
        model.addAttribute("user", user);
        model.addAttribute("postList", postList);
        return "C_profile";
    }

    @RequestMapping("toEditProfile")
    public String toEditProfile(Model model, HttpSession session) {
        model.addAttribute("profile", "editProfile");
        Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
        User user = userService.getEditInfo(uid);
        model.addAttribute("user", user);
        return "C_profile";
    }

    /**
     * 执行个人信息的编辑
     *
     * @param user
     * @return
     */
    @RequestMapping("editProfile")
    public String editProfile(User user) {
        //System.out.println(user);
        userService.updateUser(user);
        return "redirect:toMyProfile";
    }

    @RequestMapping("updatePassword")
    public String updatePassword(String password, String newPassword, String rePassword, Model model, HttpSession session) {
        Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
        String status = userService.updatePassword(password, newPassword, rePassword, uid);
        if (status.equals("ok")) {
            return "redirect:logout";
        }else {
            model.addAttribute("profile", "editProfile");
            model.addAttribute("passwordError",status);
            return "C_profile";
        }
    }

    @RequestMapping("forgetPassword")
    @ResponseBody
    public void forgetPassword(String email){
        userService.forgetPassword(email);
    }




    @RequestMapping("userCenter")
    public String toUserCenter(Model model, HttpSession session) {
        model.addAttribute("profile", "userCenter");
        int uid = Integer.parseInt((String) session.getAttribute("uid"));
        User user = userService.selectUserByUid(uid);
        model.addAttribute("user", user);
        return "profile";
    }

    @RequestMapping("userMessage")
    public String toUserMessages(Model model, HttpSession session) {
        model.addAttribute("profile", "userMessage");

        return "profile";
    }

    @RequestMapping("followList")
    public String toUserFollowList(Model model, HttpSession session) {
        model.addAttribute("profile", "followList");

        return "profile";
    }

    @RequestMapping("userPosts")
    public String toUserPosts(Model model, HttpSession session) {
        model.addAttribute("profile", "userPosts");

        return "profile";
    }
}
