package com.Eanvan.service;

import com.Eanvan.mapper.PostMapper;
import com.Eanvan.mapper.ReplyMapper;
import com.Eanvan.model.Comment;
import com.Eanvan.model.Post;
import com.Eanvan.model.Reply;
import com.Eanvan.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyService {

    @Autowired
    private PostMapper postMapper;
    @Autowired
    private ReplyMapper replyMapper;

    public List<Reply> listReplies(int pid) {
        //根据具体的post的Id项列出应该有的回复
        List<Reply> replyList = replyMapper.getRepliesByPid(pid);
        //获取每一个回复下的评论
        for (Reply reply : replyList) {
            List<Comment> comments = replyMapper.getReplyComments(reply.getRid());
            reply.setCommentList(comments);
        }
        return replyList;
    }


    public void reply(Integer uid, int pid, Reply reply) {
        //创建一个对象方便插入数据
        User user = new User(uid);
        Post post = new Post(pid);
        reply.setUser(user);
        reply.setPost(post);
        replyMapper.insertReply(reply);
        postMapper.updateReplyCount(pid);
        postMapper.updateReplyTime(pid);
        //可以通过异步的task Executor来像用户发送一个消息通知
        //到时候补全

    }

    public void comment(int pid, Integer uid, int rid, String content) {
        User user = new User(uid);
        Reply reply = new Reply(rid);
        Comment comment = new Comment();
        comment.setUser(user);
        comment.setReply(reply);
        comment.setContent(content);
        replyMapper.insertComment(comment);
        postMapper.updateReplyTime(pid);//最新的回复时间，有点像贴吧的更新时间
        //通过异步的task Executor来像用户发送一个消息通知
        //到时候补全
    }

}
