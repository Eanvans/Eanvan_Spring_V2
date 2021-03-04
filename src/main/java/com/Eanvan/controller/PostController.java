package com.Eanvan.controller;

import com.Eanvan.model.*;
import com.Eanvan.service.PostService;
import com.Eanvan.service.ReplyService;
import com.Eanvan.service.TopicService;
import com.Eanvan.service.UserService;
import org.apache.taglibs.standard.extra.spath.Step;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * publishOffPost
 * toOffPublish
 * toPublish
 * publishPost
 * toPost
 * listPostByTime
 */
@Controller
@RequestMapping("/")
public class PostController {

    @Autowired
    private PostService postService;
    @Autowired
    private TopicService topicService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    private UserService userService;


    //发布Official的Post，Blog或者其他方面的声明
    @RequestMapping("publishOffPost")
    public String publishOfficialPost(Post post, HttpSession session) {
        int pid = postService.publishOfficialBlog(post);
        return "redirect:toPostDetail?pid=" + pid;
    }

    //Off添加official的缩写
    @RequestMapping("toOffPublish")
    public String toOfficialPublish(Model model) {
        //PublishMode 如果是0的话就是官方发布Blog等模式的mode
        model.addAttribute("publishMode", 0);
        List<Topic> topics = topicService.selectTopicByTid(1);
        model.addAttribute("topicList", topics);
        return "publish";
    }

    //社区发帖的页面
    @RequestMapping("toPublish")
    public String toPublish(Model model) {
        List<Topic> topicList = topicService.listTopics();
        model.addAttribute("topicList", topicList);
        return "C_publish";
    }

    //发帖
    @RequestMapping("publishPost")
    public String publishPost(Post post) {
        int id = postService.publishPost(post);
        return "redirect:toPost?pid=" + id;
    }

    //去帖子详情页面
    @RequestMapping("toPost")
    public String toPost(int pid, Model model, HttpSession session) {
        Integer sessionUid = Integer.parseInt((String) session.getAttribute("uid"));
        //获取帖子信息
        Post post = postService.getPostByPid(pid);
        //获取评论信息
        List<Reply> replyList = replyService.listReplies(pid);

        //判断用户是否已经点赞
        boolean liked = false;
        if (sessionUid != null) {
            liked = postService.getLikeStatus(pid, sessionUid);
        }
        //向模型中添加数据
        model.addAttribute("post", post);
        model.addAttribute("replyList", replyList);
        model.addAttribute("liked", liked);
        return "C_post";
    }

    //按时间，倒序，列出帖子
    @RequestMapping("listPostByTime")
    public String listPostByTime(int curPage, Model model) {
        PageBean<Post> pageBean = postService.listPostByTime(curPage);
        List<User> userList = userService.listUserByTime();
        List<User> hotUserList = userService.listUserByHot();
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("userList", userList);
        model.addAttribute("hotUserList", hotUserList);
        return "C_index";
    }

}
