package com.Eanvan.controller;

import com.Eanvan.model.Announcement;
import com.Eanvan.model.Message;
import com.Eanvan.model.PageBean;
import com.Eanvan.service.MessageService;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * toMessage
 */
@Controller
@RequestMapping("/")
public class MessageController {
    @Autowired
    private MessageService messageService;

    /**
     * 前往消息页面
     * @param model
     * @param session
     * @return C_message 社区使用的消息页面
     */
    @RequestMapping("toMessage")
    public String toMessage(Model model, HttpSession session)
    {
        Integer uid = Integer.parseInt((String)session.getAttribute("uid"));
        Map<String, List<Message>> map = messageService.listMessageByUid(uid);
        model.addAttribute("map",map);
        return "C_message";
    }

    @RequestMapping(value = "showAnnouncement",method = RequestMethod.POST,produces = {"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getAnnouncement(){
        PageBean<Announcement> announcementPageBean = messageService.listAnnouncementByTime(1);

        return "allAnnouncement";
    }

    @RequestMapping(value = "toAnnouncement",method = RequestMethod.GET)
    public String toAnnouncement(Integer amid, Model model){
        Announcement announcement = messageService.getAnnouncementByAmid(amid);
        model.addAttribute("ann",announcement);
        return "announcement";
    }

    @RequestMapping("publishAnnouncement")
    public String publishNewAnnouncement(Announcement announcement){

        return "announcement";
    }
}
