package com.wynlink.lsa.core.controller;


import com.wynlink.common.pojo.ApiResult;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 标签体系表 前端控制器
 * </p>
 *
 * @author ChenLong
 * @since 2020-09-30
 */
@Api("标签体系表 前端控制器")
@RestController
@RequestMapping("/core/label/system")
public class CoreLabelSystemInfoController {

    public ApiResult list () {
        return ApiResult.success();
    }
}

