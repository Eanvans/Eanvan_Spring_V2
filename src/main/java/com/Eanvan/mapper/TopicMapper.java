package com.Eanvan.mapper;

import com.Eanvan.model.SubTopicCity;
import com.Eanvan.model.SubTopicCitySections;
import com.Eanvan.model.Topic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TopicMapper {

    Topic selectTopicByTid(int i);

    List<Topic> listTopics();

    List<String> listImages();

    void insertTopic(Topic topic);

    List<SubTopicCity> listCityTopicByTid(int tid);

    List<SubTopicCitySections> listCitySectionByCityId(int cityId);

    Topic getTopicByTid(int tid);

    SubTopicCity getCityByCityId(int cityId);

    SubTopicCitySections getCitySectionByCityIdAndName(@Param("cityId") int cityId,@Param("name") String sectionName);
}

