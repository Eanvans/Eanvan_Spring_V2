package com.Eanvan.controller;

import com.Eanvan.model.Comment;
import com.Eanvan.model.Reply;
import com.Eanvan.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * reply
 * comment
 */
@Controller
@RequestMapping("/")
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    /**
     * 暂时回复与comment都通过刷新页面的方式来解决这个问题，
     * 但为了提升用户的体验，最终应改善为使用类似Ajax的方式去解决这个问题，
     * 并同时要考虑到整体刷新的同步性
     * @param reply
     * @param session
     * @return
     */
    @RequestMapping(value = "reply", method = RequestMethod.POST)
    public String reply(Reply reply, HttpSession session) {
        Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
        replyService.reply(uid, reply.getPost().getPid(), reply);
        return "redirect:toPostDetail?pid=" + reply.getPost().getPid();
    }

    @RequestMapping(value = "comment", method = RequestMethod.POST)
    public String comment(Comment comment, HttpSession session) {
        Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
        replyService.comment(comment.getReply().getPost().getPid(), uid, comment.getReply().getRid(), comment.getContent());
        return "redirect:toPostDetail?pid=" + comment.getReply().getPost().getPid();
    }


    /**
     * 用于区分博客的回复与社区的回复 C_ 一律代表用于社区的回复
     * @param reply
     * @param session
     * @return
     */
    @RequestMapping(value = "C_reply", method = RequestMethod.POST)
    public String reply_C(Reply reply, HttpSession session) {
        Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
        replyService.reply(uid, reply.getPost().getPid(), reply);
        return "redirect:toPost?pid=" + reply.getPost().getPid();
    }

    @RequestMapping(value = "C_comment", method = RequestMethod.POST)
    public String comment_C(Comment comment, HttpSession session) {
        Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
        replyService.comment(comment.getReply().getPost().getPid(), uid, comment.getReply().getRid(), comment.getContent());
        return "redirect:toPost?pid=" + comment.getReply().getPost().getPid();
    }
}


