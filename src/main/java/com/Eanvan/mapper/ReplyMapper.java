package com.Eanvan.mapper;

import com.Eanvan.model.Comment;
import com.Eanvan.model.Reply;

import java.util.List;

public interface ReplyMapper {

    List<Reply> getRepliesByPid(int pid);

    List<Comment> getReplyComments(int rid);

    void insertReply(Reply reply);

    void insertComment(Comment comment);
}
