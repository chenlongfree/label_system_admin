package com.wynlink.lsa.sys.controller;


import com.wynlink.common.Constants;
import com.wynlink.common.pojo.ApiResult;
import com.wynlink.common.secure.RedisSubject;
import com.wynlink.lsa.sys.model.SysUser;
import com.wynlink.lsa.sys.service.ISysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ChenLong
 * @since 2020-09-28
 */
@Api("系统用户管理相关接口")
@RestController
@RequestMapping("/sys/user")
public class SysUserController {

    @Resource ISysUserService iSysUserService;
    @Resource RedisSubject redisSubject;

    @ApiOperation(value = "用户登录接口")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "username", value = "登录用户名", required = true, paramType = "form", dataType = "String"),
        @ApiImplicitParam(name = "password", value = "登录密码", required = true, paramType = "form", dataType = "String")
    })
    @PostMapping("/login")
    public ApiResult login(@Valid @RequestBody SysUser entity) {

        SysUser one = iSysUserService.getOneByUsername(entity.getUsername());
        if(one == null) {
            return ApiResult.failed("用户名不存在");
        } else if(!entity.getPassword().equals(one.getPassword())) {
            return ApiResult.failed("密码错误");
        } else {

            List<String> roles = Arrays.asList("admin");
            one.setRoles(roles);
            String token = UUID.randomUUID().toString();
            redisSubject.setSysUser(token, one);
            one.setToken(token);
            return ApiResult.success(one);
        }
    }

    @ApiOperation(value = "退出登录")
    @PostMapping("/logout")
    public ApiResult logout() {

        return ApiResult.success();
    }

    @ApiOperation(value = "获取用户信息接口")
    @GetMapping("/info")
    public ApiResult info() {
        return ApiResult.success(redisSubject.getSysUser());
    }
}

