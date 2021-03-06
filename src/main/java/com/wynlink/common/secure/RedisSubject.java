package com.wynlink.common.secure;

import com.wynlink.common.Constants;
import com.wynlink.lsa.sys.model.SysUser;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * redis 登录用户管理
 */
@Component
public class RedisSubject {

    @Resource
    RedisTemplate<String, SysUser> redisTemplate;

    public void setSysUser (String token, SysUser sysUser) {
        redisTemplate.opsForValue().set(Constants.HEADER_TOKEN + ":" + token, sysUser, 2, TimeUnit.HOURS);
    }

    public SysUser getSysUser() {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        String token = request.getHeader(Constants.HEADER_TOKEN);
        return redisTemplate.opsForValue().get(Constants.HEADER_TOKEN + ":" + getToken());
    }

    public boolean remove() {
        return redisTemplate.delete(Constants.HEADER_TOKEN + ":" + getToken());
    }

    /**
     * 是否过期
     * @return
     */
    public boolean expire() {
        return !redisTemplate.hasKey(Constants.HEADER_TOKEN + ":" + getToken());
    }

    /**
     * 获取token
     * @return
     */
    public String getToken() {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        return request.getHeader(Constants.HEADER_TOKEN);
    }
}
