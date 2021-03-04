package com.Eanvan.service;

import com.Eanvan.mapper.ResourceMapper;
import com.Eanvan.model.Content;
import com.Eanvan.model.ImgResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    /**
     * 获取Eanvan主页的图片等资源的url
     * 这里在后期可能会产生大量的问题，但是目前暂时先使用这样的设计
     *
     * @return List<ImgResource>
     */
    public List<ImgResource> getEanvanImgResource() {
        List<ImgResource> imgResourceList = resourceMapper.getEanvanImgResourceByName("homePage");
        return imgResourceList;
    }

    /**
     * 获取Eanvan主页的内容资源
     *  临时使用
     * @return List<Content>
     */
    public List<Content> getEanvanContentResource() {
        List<Content> contentList = resourceMapper.getEanvanContentResourceByName("homePage");
        /*
         * 1.Eanvan是什么
         * 2.Eanvan可以提供什么
         * 3.Envan的初衷是什么
         * */
        return contentList;
    }


}
