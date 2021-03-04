package com.Eanvan.service;

import com.Eanvan.mapper.MessageMapper;
import com.Eanvan.model.Announcement;
import com.Eanvan.model.Message;
import com.Eanvan.model.PageBean;
import com.Eanvan.utils.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service
public class MessageService {

    @Autowired
    private MessageMapper messageMapper;

    public Map<String, List<Message>> listMessageByUid(Integer uid) {
        List<Message> messageList = messageMapper.listMessageByUid(uid);
        Map<String, List<Message>> map = new HashMap<>();
        for (Message message : messageList) {
            String time = MyUtils.formateDate(message.getMsgTime()).substring(0, 11);
            //暂时还不清楚为什么会出现null值的情况
            if (map.get(time) == null) {
                map.put(time, new LinkedList<Message>());
                map.get(time).add(message);
            } else {
                map.get(time).add(message);
            }
        }
        return map;
    }

    /**
     * 返回网站的公告栏数据，设置公告栏每页的最大数据量为 5
     *
     * @param curPage
     * @return
     */
    public PageBean<Announcement> listAnnouncementByTime(int curPage) {
        int offset = (curPage - 1) * 5;
        int allCount = messageMapper.getAnnouncementCounts();
        int allPage = 0;
        if (allCount <= 5 && allCount > 0) {
            allPage = 1;
        } else {
            allPage = allCount / 5 + 1;
        }
        List<Announcement> announcementList = messageMapper.listAnnouncementByTime(offset, 5);
        PageBean<Announcement> announcementPageBean = new PageBean<>(allPage, curPage);
        announcementPageBean.setList(announcementList);
        return announcementPageBean;
    }

    public Announcement getAnnouncementByAmid(int amid) {
        return messageMapper.getAnnouncementByAmid(amid);
    }
}
