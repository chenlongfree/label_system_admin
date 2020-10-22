package com.wynlink;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.context.request.RequestContextListener;

@SpringBootApplication
@ServletComponentScan("com.wynlink")
public class LabelSystemAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(LabelSystemAdminApplication.class, args);
    }

    /**
     * 用于 RequestContextHolder 获取 request
     * @return
     */
    @Bean
    public RequestContextListener requestContextListener(){
        return new RequestContextListener();
    }
}
