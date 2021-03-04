package com.Eanvan.model;

public class PostAttachments {
    private Integer pattid;
    //外键关联Post的Id值\
    private Integer uid;
    private String picUrl;

    public PostAttachments() {
    }

    public Integer getPattid() {
        return pattid;
    }

    public void setPattid(Integer pattid) {
        this.pattid = pattid;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "PostAttachments{" +
                "pattid=" + pattid +
                ", picUrl='" + picUrl + '\'' +
                ", uid=" + uid +
                '}';
    }
}
