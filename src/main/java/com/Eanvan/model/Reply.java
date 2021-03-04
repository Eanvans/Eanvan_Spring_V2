package com.Eanvan.model;


import java.util.List;

public class Reply {
    private Integer rid;
    private String content;

    //外键，指向Post和User
    private Post post;
    private User user;

    private String replyTime;

    private List<Comment> commentList;

    @Override
    public String toString() {
        return "Reply{" +
                "rid=" + rid +
                ", content='" + content + '\'' +
                ", post=" + post +
                ", user=" + user +
                ", replyTime='" + replyTime + '\'' +
                ", commentList=" + commentList +
                '}';
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public Reply(Integer rid) {
        this.rid = rid;
    }

    public Reply() {
    }
}
