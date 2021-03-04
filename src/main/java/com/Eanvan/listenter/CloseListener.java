package com.Eanvan.listenter;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.stereotype.Service;

@Service
public class CloseListener implements ApplicationListener<ContextClosedEvent> {

    private static Logger logger = Logger.getLogger(CloseListener.class);

    @Override
    public void onApplicationEvent(ContextClosedEvent contextClosedEvent) {
        logger.info("服务器关闭~");
    }

}
