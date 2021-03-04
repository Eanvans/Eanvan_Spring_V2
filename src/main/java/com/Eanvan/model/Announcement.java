package com.Eanvan.model;

import com.alibaba.fastjson.annotation.JSONField;

public class Announcement {
    private Integer amid;

    @JSONField(name = "user")
    private User user;
    @JSONField(name = "title")
    private String title;
    @JSONField(name = "content")
    private String content;
    @JSONField(name = "time")
    private String updateTime;
    private String url;

    public Integer getAmid() {
        return amid;
    }

    public void setAmid(Integer amid) {
        this.amid = amid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Announcement() {
    }

    public Announcement(Integer amid, User user, String title, String content, String updateTime) {
        this.amid = amid;
        this.user = user;
        this.title = title;
        this.content = content;
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "amId=" + amid +
                ", user=" + user +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", updateTime='" + updateTime + '\'' +
                '}';
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public Announcement(User user) {
        this.user = user;
    }
}
