package com.wynlink;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan("com.wynlink")
public class LabelSystemAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(LabelSystemAdminApplication.class, args);
    }

}
