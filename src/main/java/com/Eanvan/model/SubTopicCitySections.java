package com.Eanvan.model;

public class SubTopicCitySections {
    private Integer id;
    /**
     * cityId关联CityTopic的Id
     */
    private Integer cityId;
    private String name;
    private String content;
    private String imageUrl;

    @Override
    public String toString() {
        return "SubTopicCitySections{" +
                "cityId=" + cityId +
                ", id=" + id +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", image='" + imageUrl + '\'' +
                '}';
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getImage() {
        return imageUrl;
    }

    public void setImage(String image) {
        this.imageUrl = image;
    }

    public SubTopicCitySections() {
    }

    public SubTopicCitySections(Integer cityId) {
        this.cityId = cityId;
    }
}
