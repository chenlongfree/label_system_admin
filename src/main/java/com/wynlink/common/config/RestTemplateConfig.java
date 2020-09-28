package com.wynlink.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * 配置实例化 RestTemplate
 */
@Component
public class RestTemplateConfig {

    /** 配置restTemplate */
    @Bean
    public RestTemplate restTemplate() {

        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(15000);
        factory.setReadTimeout(5000);

        RestTemplate restTemplate = new RestTemplate(factory);
        restTemplate.getMessageConverters().add(new WechatMappingJackson2HttpMessageConverter());
        return restTemplate;
    }
}

/**
 * 微信返回值转换
 */
class WechatMappingJackson2HttpMessageConverter extends MappingJackson2HttpMessageConverter {
    public WechatMappingJackson2HttpMessageConverter(){
        List<MediaType> mediaTypes = new ArrayList<>();
        mediaTypes.add(MediaType.TEXT_PLAIN);
        mediaTypes.add(MediaType.TEXT_HTML);
        setSupportedMediaTypes(mediaTypes);
    }
}
