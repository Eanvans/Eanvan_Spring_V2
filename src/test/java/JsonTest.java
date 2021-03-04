import com.Eanvan.model.Announcement;
import com.Eanvan.model.User;
import com.alibaba.fastjson.JSON;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class JsonTest {

    private List<Announcement> announcementList = new ArrayList<Announcement>();

    @Before
    public void setUpData() {
        User user = new User();
        user.setUid(1);
        user.setUsername("ttest");
        user.setHeadUrl("sdasd");

        announcementList.add(new Announcement(1, user, "测试公告", "公告的内容", "2020-2-2"));
        announcementList.add(new Announcement(2, user, "测试公告1", "公告的内容1", "2020-2-23"));
    }

    @Test
    public void testObjectToJson() {
        String json = JSON.toJSONString(announcementList);
        System.out.println(json);
    }
}
