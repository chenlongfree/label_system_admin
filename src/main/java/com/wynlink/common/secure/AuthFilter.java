package com.wynlink.common.secure;

import cn.hutool.json.JSONUtil;
import com.wynlink.common.Constants;
import com.wynlink.common.pojo.ApiResult;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@WebFilter(filterName = "authFilter", urlPatterns = "/*")
public class AuthFilter implements Filter {

    @Resource RedisSubject redisSubject;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.error("初始化");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String requestURI = req.getRequestURI();

        if (requestURI.endsWith("login")) {
            chain.doFilter(request, response);
        } else if(redisSubject.getToken() == null) {
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/json; charset=utf-8");
            response.getWriter().write(JSONUtil.parse(ApiResult.failed("用户未登录", ApiResult.SC_UNAUTHORIZED)).toString());
        } else if(redisSubject.expire()){
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/json; charset=utf-8");
            response.getWriter().write(JSONUtil.parse(ApiResult.failed("登录已过期", ApiResult.SC_UNAUTHORIZED)).toString());
        } else {
            chain.doFilter(request, response);
        }
    }
}
