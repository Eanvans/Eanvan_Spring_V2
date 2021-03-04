package com.Eanvan.service;

import com.Eanvan.async.SaveImageTask;
import com.Eanvan.mapper.PostMapper;
import com.Eanvan.model.PageBean;
import com.Eanvan.model.Post;
import com.Eanvan.model.PostAttachments;
import com.Eanvan.utils.MyUtils;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

import java.util.Date;
import java.util.List;

@Service
public class PostService {

    @Autowired
    private PostMapper postMapper;
    @Autowired
    private TaskExecutor taskExecutor;

    //每个Post页面的post限制
    private final int postPageLimit = 8;


    //根据Uid获取post
    public List<Post> getPostList(int uid) {
        return postMapper.listPostByUid(uid);
    }

    //发布Post
    public int publishPost(Post post) {
        post.setPublishTime(MyUtils.formateDate(new Date()));
        post.setReplyTime(MyUtils.formateDate(new Date()));
        post.setReplyCount(0);
        post.setLikeCount(0);
        post.setScanCount(0);
        postMapper.insertPost(post);
        return post.getPid();
    }

    /*根据tid选取post
     * 暂时未提供分页功能*/
    public List<Post> getOfficialBlogs() {
        //规定Tid为1的都是官方Posts
        return postMapper.listPostByTid(1);
    }

    public Post getPostByPid(int pid) {
        //更新浏览数
        postMapper.updateScanCount(pid);
        Post post = postMapper.getPostByPid(pid);
        //获取评论信息
        return post;
    }

    public int publishOfficialBlog(Post post) {
        //构造帖子
        post.setPublishTime(MyUtils.formateDate(new Date()));
        post.setReplyTime(MyUtils.formateDate(new Date()));
        post.setReplyCount(0);
        post.setScanCount(0);
        post.setLikeCount(0);
        //插入一条记录
        postMapper.insertPost(post);
        //更新用户的发帖量
        return post.getPid();
    }


    public String uploadPostPics(byte[] bytes, String remoteFileName, Integer uid) {
        taskExecutor.execute(new SaveImageTask(bytes, MyUtils.getRealPostPicPath(), remoteFileName));
        //根据Post的ID进行图片文件名称的存储
        PostAttachments postAttachments = new PostAttachments();
        postAttachments.setUid(uid);
        postAttachments.setPicUrl(MyUtils.getVirtualPostPicPath() + remoteFileName);
        postMapper.insertPostAttachment(postAttachments);
        return postAttachments.getPicUrl();
    }

    /**
     * @param curPage 当前页面
     * @return
     */
    public PageBean<Post> listPostByTime(int curPage) {
        //每页记录数
        int offset = (curPage - 1) * postPageLimit;
        //获得总记录数，总页数
        int allCount = postMapper.selectPostCount();
        int allPage = 0;

        if (allCount <= postPageLimit) {
            allPage = 1;
        } else if (allCount / postPageLimit == 0) {
            allPage = allCount / postPageLimit;
        } else {
            allPage = allCount / postPageLimit + 1;
        }
        //分页得到的数据列表
        List<Post> postList = postMapper.listPostByTime(offset, postPageLimit);

        //暂时还不启用使用Jedis的功能
        //Jedis jedis =
        /*for (Post post:postList){
            post.setLikeCount();
        }*/

        //构造pageBean
        PageBean<Post> pageBean = new PageBean<>(allPage, curPage);
        pageBean.setList(postList);
        /*if(jedis != null){
            jedisPool.returnResource(jedis);
        }
        * */
        return pageBean;
    }

    public boolean getLikeStatus(int pid, Integer sessionUid) {
        /*
         Jedis jedis = jedisPool.getResource();
        boolean result = jedis.sismember(pid+":like", String.valueOf(sessionUid));

        if(jedis!=null){
            jedisPool.returnResource(jedis);
        }
        return result;
         */
        //暂时都不启用redis的功能
        return false;
    }

    /**
     * 返回当前页面包含的帖子数据
     *
     * @param tid     帖子的id值
     * @param curPage 当前页面
     * @return
     */
    public PageBean<Post> listTopicPosts(int tid, int curPage) {
        int offset = (curPage - 1) * postPageLimit;

        int allCount = postMapper.selectPostCountByTid(tid);
        int allPage = 0;

        if (allCount <= postPageLimit && allCount > 0) {
            allPage = 1;
        } else {
            allPage = allCount / postPageLimit + 1;
        }
        List<Post> postList = postMapper.listSectionPostsByTid(tid, offset, postPageLimit);
        PageBean<Post> pageBean = new PageBean<>(allPage, curPage);
        pageBean.setList(postList);
        return pageBean;
    }

    /**
     * 返回国家Topic下的所有的城市的Topic
     * 并以tid为基准获取 获取当前国家下的所有posts
     *
     * @param tid
     * @param cityId
     * @param curPage
     * @return
     */
    public PageBean<Post> listCityTopicPosts(int tid, int cityId, int curPage) {
        int offset = (curPage - 1) * postPageLimit;
        int allCount = postMapper.selectPostCountByTidAndCityId(tid, cityId);
        int allPage = 0;
        if (allCount <= postPageLimit && allCount > 0) {
            allPage = 1;
        } else {
            allPage = allCount / postPageLimit + 1;
        }
        List<Post> postList = postMapper.listCityPostsByCityId(cityId, offset, postPageLimit);
        PageBean<Post> pageBean = new PageBean<>(allPage, curPage);
        pageBean.setList(postList);
        return pageBean;
    }

    /**
     * 返回国家 -> 城市分区下的所有的 section 分区
     * 并以cityId为基准获取当前城市下的所有posts
     *
     * @param cityId
     * @param sectionName
     * @param curPage
     * @return
     */
    public PageBean<Post> listCitySectionPostS(int cityId, String sectionName, int curPage) {
        int offset = (curPage - 1) * postPageLimit;
        int allCount = postMapper.selectPostCountByCityIdAndSectionName(cityId,sectionName);
        int allPage = 0;
        if (allCount <= postPageLimit && allCount > 0) {
            allPage = 1;
        } else {
            allPage = allCount / postPageLimit + 1;
        }
        List<Post> postList = postMapper.listCitySectionPostsByCityIdAndSectionName(cityId,sectionName,offset,postPageLimit);
        PageBean<Post> pageBean = new PageBean<>(allPage,curPage);
        pageBean.setList(postList);
        return pageBean;
    }
}
