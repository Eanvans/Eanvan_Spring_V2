package com.Eanvan.model;

public class ImgResource {
    private int id;
    private String name;
    private String memo;
    private String headUrl;

    @Override
    public String toString() {
        return "ImgResource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", memo='" + memo + '\'' +
                ", headUrl='" + headUrl + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }

    public ImgResource() {
    }
}
