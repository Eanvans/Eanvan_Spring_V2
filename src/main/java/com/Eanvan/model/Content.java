package com.Eanvan.model;

/**
 * 官方主页的内容
 */
public class Content {
    private int id;
    private String name;
    private String content;
    private String tag;

    @Override
    public String toString() {
        return "Content{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", tag='" + tag + '\'' +
                '}';
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Content() {
    }

    public Content(String name, String content) {
        this.name = name;
        this.content = content;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Content(int id, String name, String content) {
        this.id = id;
        this.name = name;
        this.content = content;
    }
}
