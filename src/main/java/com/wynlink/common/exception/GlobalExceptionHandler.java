package com.wynlink.common.exception;

import com.wynlink.common.pojo.ApiResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

/**
 * 统一异常处理
 */
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ResponseBody
    @ExceptionHandler(Exception.class)
    public ApiResult globalException(HttpServletResponse response, Exception ex){
        log.error(ex.getMessage());
        return ApiResult.exception("request error:"+response.getStatus() + "\tGlobalExceptionHandler:"+ex.getMessage());
    }
}
