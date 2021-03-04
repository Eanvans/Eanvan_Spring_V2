package com.Eanvan.model;

public class SubTopicCity {
    private Integer cityId;
    /**
     * tid关联topic
     */
    private Integer tid;
    private String name;
    private String content;
    private String imageUrl;



    public SubTopicCity(Integer tid) {
        this.tid = tid;
    }

    @Override
    public String toString() {
        return "SubTopicCity{" +
                "cityId=" + cityId +
                ", tid=" + tid +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }

    public SubTopicCity() {
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
