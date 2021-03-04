package com.Eanvan.controller;

import com.Eanvan.service.PostService;
import com.Eanvan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
import java.util.UUID;

/**
 * upload
 * uploadPic
 */
@Controller
@RequestMapping("/")
public class upLoadController {

    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;

    //允许的图片文件类型
    private final String[] allowTypes = {"image/bmp", "image/gif", "image/jpeg", "image/png"};

    private boolean checkPicFileType(String type){
        return Arrays.asList(allowTypes).contains(type);
    }
    private boolean checkPicFileSize(long size){
        //允许的图片文件大小 3MB
        long allowedSize = 3 * 1024 * 1024;
        return size < allowedSize;
    }


    //头像上传的位置
    @RequestMapping(value = "upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String upLoadUserImg(@RequestParam("myFileName") MultipartFile myFileName, HttpSession session) {
        //支持的文件类型
        if (!checkPicFileType(myFileName.getContentType()))
            return "不支持的文件类型！";
        if (checkPicFileSize(myFileName.getSize()))
            return "图片大小不能超过3M~";
        String oriFileName = myFileName.getOriginalFilename();
        String fileNameExtension = oriFileName.substring(oriFileName.indexOf('.'));
        //生成云端的真实文件名，UUID会根据设备的MAC地址，CPU 标识，时间等信息计算
        String remoteFileName = UUID.randomUUID().toString() + fileNameExtension;

        Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
        //本想用于存储到云端的固定位置，放弃存储到数据库中，这样会导致每一个user对象都异常的庞大
        try {
            userService.uploadUserHeadImg(myFileName.getBytes(), remoteFileName,uid);
        } catch (IOException e) {
            return "上传失败~";
        }
        return "上传成功~";
    }

    //post中图片上传的位置
    //用户点击的情况下，是先上传图片还是先上传文字信息,先上传图片信息，然后将id存入session域
    //上传完成后从session域中删除
    @RequestMapping(value = "uploadPic",method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String uploadPostPics(@RequestParam("picName") MultipartFile picName,HttpSession session){
        String remoteFilename = "";
        if (checkPicFileType(picName.getContentType()) && checkPicFileSize(picName.getSize())){
            String fileNameExtension = Objects.requireNonNull(picName.getOriginalFilename()).substring(picName.getOriginalFilename().indexOf('.'));
            String remoteFileName = UUID.randomUUID().toString() + fileNameExtension;
            Integer uid = Integer.parseInt((String) session.getAttribute("uid"));
            try {
                remoteFilename =  postService.uploadPostPics(picName.getBytes(),remoteFileName,uid);
            } catch (IOException ignored){}
        }
        return remoteFilename;
    }




}
