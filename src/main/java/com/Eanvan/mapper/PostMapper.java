package com.Eanvan.mapper;

import com.Eanvan.model.Post;
import com.Eanvan.model.PostAttachments;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostMapper {

    //这里使用了last——insert_id函数在插入一条记录后获取新post的pid值
    int insertPost(Post post);

    List<Post> listPostByUid(int uid);

    List<Post> listPostByTid(int tid);

    /**
     * 选择非官方博客的Post的数量，定义官方博客的tid都为 1
     * @return int 数量
     */
    int selectPostCount();

    Post getPostByPid(int pid);

    void updateScanCount(int pid);

    void updateReplyCount(int pid);

    void updateReplyTime(int pid);

    int insertPostAttachment(PostAttachments postAttachments);

    List<Post> listPostByTime(@Param("offset") int offset,@Param("limit") int limit);

    int selectPostCountByTid(int tid);

    /**
     * 不能定义相同的方法名
     */
    List<Post> listSectionPostsByTid(@Param("tid") int tid,@Param("offset") int offset,@Param("limit") int limit);

    int selectPostCountByTidAndCityId(@Param("tid") int tid,@Param("cityId") int cityId);

    List<Post> listCityPostsByCityId(@Param("cityId") int cityId,@Param("offset") int offset,@Param("limit") int postPageLimit);

    int selectPostCountByCityIdAndSectionName(@Param("cityId") int cityId,@Param("sectionName") String sectionName);

    List<Post> listCitySectionPostsByCityIdAndSectionName(@Param("cityId") int cityId,@Param("sectionName") String sectionName,@Param("offset") int offset,@Param("limit") int postPageLimit);
}
