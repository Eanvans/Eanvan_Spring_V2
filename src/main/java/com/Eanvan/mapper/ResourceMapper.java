package com.Eanvan.mapper;

import com.Eanvan.model.Content;
import com.Eanvan.model.ImgResource;

import java.util.List;

public interface ResourceMapper {

    /*获取eanvan主页的图片资源*/
    List<ImgResource> getEanvanImgResourceByName(String name);

    /*获取eanvan主页的文字资源*/
    List<Content> getEanvanContentResourceByName(String name);


}
