package com.wynlink.common.redis;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.Duration;
import java.util.concurrent.TimeUnit;

@Service
public class RedisService {

	@Resource private RedisTemplate<String, Object> redisTemplate;
	
    public void set(String key, Object value) {
        //更改在redis里面查看key编码问题
        try {
        	RedisSerializer<?> redisSerializer = new  StringRedisSerializer();
            redisTemplate.setKeySerializer(redisSerializer);
            ValueOperations<String, Object> vo =  redisTemplate.opsForValue();
            vo.set(key, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    public Object get(String key) {
        ValueOperations<String, Object> vo =  redisTemplate.opsForValue();
        return vo.get(key);
    }
    
    public Boolean hasKey(String key) {
    	return redisTemplate.hasKey(key);
    }
    
    /**
     * 重新设置超时时间（单位分钟）
     * @param key
     * @param timeout
     * @return
     */
    public Boolean expireMin(String key, long timeout) {
    	return redisTemplate.expire(key,30,TimeUnit.MINUTES);
    }
}
