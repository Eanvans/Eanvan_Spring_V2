package com.Eanvan.service;

import com.Eanvan.mapper.PostMapper;
import com.Eanvan.mapper.TopicMapper;
import com.Eanvan.model.SubTopicCity;
import com.Eanvan.model.SubTopicCitySections;
import com.Eanvan.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TopicService {

    @Autowired
    private PostMapper postMapper;
    @Autowired
    private TopicMapper topicMapper;


    public List<Topic> listTopics() {
        return topicMapper.listTopics();
    }

    public List<Topic> selectTopicByTid(int i) {
        Topic topic =  topicMapper.selectTopicByTid(1);
        List<Topic> topics = new ArrayList<>();
        topics.add(topic);
        return topics;
    }

    public List<String> listImages() {
        return topicMapper.listImages();
    }

    public void addNewTopic(Topic topic) {
        topicMapper.insertTopic(topic);
    }

    public List<SubTopicCity> listCityTopicsByTopic(int tid) {
        return topicMapper.listCityTopicByTid(tid);
    }

    public List<SubTopicCitySections> listCitySectionByCity(int cityId) {
        return topicMapper.listCitySectionByCityId(cityId);
    }

    public Topic getTopicByTid(int tid) {
        return topicMapper.getTopicByTid(tid);
    }

    public SubTopicCity getCityByCityId(int cityId) {
        return topicMapper.getCityByCityId(cityId);
    }

    public SubTopicCitySections getCitySectionByCityIdAndName(int cityId, String sectionName) {
        return topicMapper.getCitySectionByCityIdAndName(cityId,sectionName);
    }
}
