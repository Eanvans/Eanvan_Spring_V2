package com.Eanvan.controller;

import com.Eanvan.model.*;
import com.Eanvan.service.PostService;
import com.Eanvan.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * listTopic
 * listImage
 * addTopic
 * topicSection/{tid}
 * topicSection/{tid}/{cityId}
 * topicSection/{tid}/{cityId}/{sectionName}
 */
@Controller
@RequestMapping("/")
public class TopicController {

    @Autowired
    private TopicService topicService;
    @Autowired
    private PostService postService;

    /**
     * 列出所有的话题
     *
     * @param model
     * @return C_topic页面
     */
    @RequestMapping("listTopic")
    public String listTopic(Model model) {
        List<Topic> topicList = topicService.listTopics();
        model.addAttribute("topicList", topicList);
        return "C_topic";
    }

    /**
     * 有待商榷，本应该是列出所有的文章
     */
    @RequestMapping("listImage")
    public String listImage(Model model) {
        List<String> imageList = topicService.listImages();
        model.addAttribute("imageList", imageList);
        return "C_image";
    }

    /**
     * 通过ajax进行topic的添加
     * 当使用 model传参时，@RequestBody 注解的作用是为了将json数据转换为model或者xml转换为model
     * 普通的表单提交就不用了
     *
     * @param topic
     * @return 添加结果
     */
    @RequestMapping(value = "addTopic", method = RequestMethod.POST)
    /* public String addTopic(@RequestBody Topic topic){*/
    public String addTopic(Topic topic) {
        topicService.addNewTopic(topic);
        return "redirect:listTopic";
    }

    /**
     * 根据Topic国家分区的tid 进入
     * 带有城市分区 以及 国家posts的页面
     *
     * @param tid     topicId
     * @param section topic 的 中文名称
     * @param content topic 的 描述
     * @return C_topicSection
     */
    @RequestMapping(value = "topicSection/{tid}", method = RequestMethod.GET)
    public String toTopicSection(@PathVariable("tid") int tid, String section, String content, Model model) {
        List<SubTopicCity> subTopicCities = topicService.listCityTopicsByTopic(tid);
        model.addAttribute("subTopic", "country");
        model.addAttribute("topicList", subTopicCities);
        model.addAttribute("topicName", section);


        Map<String, String> navigateMap = new LinkedHashMap<>();
        navigateMap.put(section, "/topicSection/" + tid + "?section=" + section + "&content=" + content + "");
        model.addAttribute("navigateMap", navigateMap);


        PageBean<Post> topicPageBean = postService.listTopicPosts(tid, 1);
        model.addAttribute("pageBean", topicPageBean);
        model.addAttribute("section", section);
        model.addAttribute("sectionContent", content);
        return "C_subTopic";
    }

    /**
     * 根据城市分区的 cityId 进入 各城市分区页面
     * 包括所有城市内的小分区 以及 城市 Posts的页面
     *
     * @param tid     topic 的 id
     * @param cityId  城市的对应id
     * @param section city的中文名
     * @param content 城市的描述名
     * @return
     */
    @RequestMapping(value = "topicSection/{tid}/{cityId}", method = RequestMethod.GET)
    public String toTopicCitySection(@PathVariable("tid") int tid, @PathVariable("cityId") int cityId, String topicName
            , String section, String content, Model model) {
        //实际Topic也就是Country 国家 -> 城市 -> 板块
        List<SubTopicCitySections> citySections = topicService.listCitySectionByCity(cityId);
        model.addAttribute("subTopic", "city");
        model.addAttribute("tid", tid);
        model.addAttribute("topicName", topicName);
        model.addAttribute("cityList", citySections);

        //用于导航栏
        Map<String, String> navigateMap = new LinkedHashMap<>();
        navigateMap.put(topicName, "/topicSection/" + tid + "?section=" + topicName + "&content=" + content + "");
        navigateMap.put(section, "/topicSection/" + tid + "/" + cityId + "?topicName=" + topicName + "&section=" + section + "&content=" + content + "");
        model.addAttribute("navigateMap", navigateMap);

        PageBean<Post> pageBean = postService.listCityTopicPosts(tid, cityId, 1);
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("cityName", section);
        model.addAttribute("cityContent", content);
        return "C_subTopic";
    }

    /**
     * 根据城市分区下的小分区的 Id或者是分区名 进入 各城市内部小分区的页面
     * 只包括了城市小分区的所有post页面
     *
     * @param tid
     * @param cityId
     * @param city
     * @param model
     * @return
     */
    @RequestMapping(value = "topicSection/{tid}/{cityId}/{sectionName}", method = RequestMethod.GET)
    public String toCitySection(@PathVariable("tid") int tid, @PathVariable("cityId") int cityId,
                                @PathVariable("sectionName") String sectionName, String topicName,
                                String city, Model model) {
        model.addAttribute("subTopic", "citySection");
        Topic topic = topicService.getTopicByTid(tid);
        SubTopicCity subTopicCity = topicService.getCityByCityId(cityId);
        SubTopicCitySections subTopicCitySection = topicService.getCitySectionByCityIdAndName(cityId, sectionName);

        //用于导航栏
        Map<String, String> navigateMap = new LinkedHashMap<>();
        navigateMap.put(topicName, "/topicSection/" + tid + "?section=" + topicName + "&content=" + topic.getContent() + "");
        navigateMap.put(city, "/topicSection/" + tid + "/" + cityId + "?topicName=" + topicName + "&section=" + subTopicCity.getName() + "&content=" + subTopicCity.getContent() + "");
        navigateMap.put(subTopicCitySection.getContent(), "/topicSection/" + tid + "/" + cityId + "/" + sectionName + "?topicName=" + topicName + "&city=" + city + "");
        model.addAttribute("navigateMap", navigateMap);

        PageBean<Post> pageBean = postService.listCitySectionPostS(cityId, sectionName, 1);
        model.addAttribute("pageBean", pageBean);
        return "C_subTopic";
    }

}

