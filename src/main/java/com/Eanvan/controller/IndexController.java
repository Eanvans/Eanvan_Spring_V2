package com.Eanvan.controller;

import com.Eanvan.async.MailTask;
import com.Eanvan.model.*;
import com.Eanvan.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * index
 * toPostDetail
 * eanvan
 * about
 * toMain
 * toEanvanBlog
 * test
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private PostService postService;
    @Autowired
    private ResourceService resourceService;
    @Autowired
    private UserService userService;
    @Autowired
    private TopicService topicService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    private TaskExecutor taskExecutor;
    @Autowired
    private LoginService loginService;
    @Autowired
    private MessageService messageService;

    /*社区主页*/
    @RequestMapping("index")
    public String toIndexPage(Model model, HttpServletRequest request) {
        //记录访问者的IP地址
        System.out.println(request.getRemoteAddr());
        return "index";
    }


    /**
     * 去帖子详情页面,仅仅用于博客的post跳转
     * @param pid
     * @param model
     * @return
     */
    @RequestMapping("toPostDetail")
    public String toPostDetail(int pid, Model model) {
        //获取帖子的信息
        Post post = postService.getPostByPid(pid);
        //获取评论信息
        List<Reply> replies = replyService.listReplies(pid);

        //向模型中添加数据
        model.addAttribute("post", post);
        model.addAttribute("replyList", replies);
        return "post";
    }

    /*Eanvan官方主页*/
    @RequestMapping("eanvan")
    public String toEanvanHomePage(Model model,HttpSession session, HttpServletRequest request) {
        String username = "",password = "";

        model.addAttribute("page", "main");
        List<ImgResource> resMap = resourceService.getEanvanImgResource();
        model.addAttribute("carouselImg", resMap);
        List<Content> contentList = resourceService.getEanvanContentResource();

        //添加通过cookie判断登录的方法
        Cookie[] cookies = request.getCookies();
        if (cookies != null){
            for (Cookie cookie: cookies) {
               if (cookie.getName().equals("eavanusn")){
                    username = cookie.getValue();
               }else if (cookie.getName().equals("eavanpwd")){
                    password = cookie.getValue();
               }
            }
        }
        //如果存在cookie进行登录
        if (!username.equals("") && !password.equals("")){
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            Map<String, Object> map = loginService.login(user);
            if (map.get("result").equals("Y")) {
                session.setAttribute("uid", map.get("uid"));
                session.setAttribute("headUrl", map.get("headUrl"));
                session.setAttribute("username", user.getUsername());
            }
        }

        PageBean<Announcement> announcementPageBean = messageService.listAnnouncementByTime(1);
        List<Announcement> announcementList = announcementPageBean.getList();
        for (Announcement announcement: announcementList) {
            announcement.setUrl("/toAnnouncement?amid=" + announcement.getAmid());
        }
        model.addAttribute("annList",announcementList);


        /*
         * 3个主要的tag
         * what,how,why*/
        for (Content c : contentList) {
            model.addAttribute(c.getTag(), c.getContent());
        }
        return "evHome";
    }

    /*Eanvan关于我们*/
    @RequestMapping("about")
    public String toAboutEanvan(Model model) {
        model.addAttribute("page", "about");
        return "about";
    }

    /**
     * 跳转到社区主页面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("toMain")
    public String toMainIndexPage(Model model, HttpServletRequest request) {
        System.out.println(request.getRemoteAddr());

        //记录访问信息
        userService.record(request.getRequestURL(),request.getContextPath(),request.getRemoteAddr());
        //列出帖子
        PageBean<Post> pageBean = postService.listPostByTime(1);
        //列出用户
        List<User> userList = userService.listUserByTime();
        //列出活跃用户
        List<User> hotUserList = userService.listUserByHot();

        model.addAttribute("pageBean",pageBean);
        model.addAttribute("userList",userList);
        model.addAttribute("hotUserList",hotUserList);

        model.addAttribute("page", "comm");
        //由于注册原因暂时无法提供跳转到社区页面的连接
        //暂时跳转到临时页
        return "C_index";
    }

    @RequestMapping("toEanvanBlog")
    public String toEanvanBlog(Model model, HttpServletRequest request) {
        model.addAttribute("page", "blog");
        List<Post> blogPosts = postService.getOfficialBlogs();
        String uid = (String) request.getSession().getAttribute("uid");
        if (uid != null) {
            Integer id = Integer.parseInt(uid);
            User user = userService.selectUserByUid(id);
            model.addAttribute("user", user);
        }
        model.addAttribute("blogList", blogPosts);
        return "blog";
    }


    @RequestMapping("test")
    public String testSave() throws IOException {
        //taskExecutor.execute(new MailTask("123","yifanb@qq.com",javaMailSender,1));
        return "";
    }

}
