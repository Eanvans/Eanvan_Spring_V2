package com.Eanvan.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:application-context.xml","classpath:spring-mvc.xml"})
public class UserMapperTest {
    @Test
    public void test(){
        System.out.println("test Pass!");
    }
}
