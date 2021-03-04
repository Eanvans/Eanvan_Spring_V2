package com.Eanvan.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@ComponentScan("com.Eanvan.async")
@EnableScheduling
public class TaskSchedulerConfig {
}
