package com.Eanvan.mapper;

import com.Eanvan.model.Announcement;
import com.Eanvan.model.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper {

    List<Message> listMessageByUid(Integer uid);


    int getAnnouncementCounts();

    List<Announcement> listAnnouncementByTime(@Param("offset") int offset,@Param("limit") int limit);

    Announcement getAnnouncementByAmid(int amid);
}
