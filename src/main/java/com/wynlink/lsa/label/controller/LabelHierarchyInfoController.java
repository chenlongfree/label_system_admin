package com.wynlink.lsa.label.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wynlink.common.Constants;
import com.wynlink.common.pojo.ApiResult;
import com.wynlink.common.secure.RedisSubject;
import com.wynlink.lsa.label.model.LabelHierarchyInfo;
import com.wynlink.lsa.label.service.ILabelHierarchyInfoService;
import com.wynlink.lsa.sys.model.SysUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * <p>
 * 标签体系表 前端控制器
 * </p>
 *
 * @author ChenLong
 * @since 2020-10-22
 */
@Api("标签体系表 前端控制器")
@RestController
@RequestMapping("/label/hierarchy")
public class LabelHierarchyInfoController {

    @Resource
    RedisSubject redisSubject;

    @Resource
    ILabelHierarchyInfoService labelHierarchyInfoService;

    @ApiOperation(value = "检索标签体系")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "page", value = "当前页", required = true, paramType = "query", dataType = "Integer"),
            @ApiImplicitParam(name = "limit", value = "每页显示记录数", required = true, paramType = "query", dataType = "Integer")
    })
    @GetMapping("/page")
    public ApiResult page (LabelHierarchyInfo entity) {

        Page page = labelHierarchyInfoService.page(entity.getIPage(), entity.getQueryWrapper());
        return ApiResult.success(page.getTotal(), page.getRecords());
    }

    @ApiOperation(value = "新增标签体系")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "name", value = "标签体系名称", required = true, paramType = "query", dataType = "Integer")
    })
    @PostMapping("/add")
    public ApiResult add (@RequestBody @Valid LabelHierarchyInfo entity) {

        SysUser sysUser = redisSubject.getSysUser();
        entity.setCreatedBy(sysUser.getUsername());
        entity.setOperate(Constants.Operate.INSERT);
        entity.setStatus(Constants.Status.DISABLED);
        entity.setAuditState(Constants.AuditState.NOT_AUDIT);
        boolean save = labelHierarchyInfoService.save(entity);
        return save ? ApiResult.success(entity.getId()) : ApiResult.failed();
    }

    @ApiOperation(value = "查询标签体系")
    @ApiImplicitParam(name = "id", value = "标签体系ID", required = true, paramType = "path", dataType = "Long")
    @GetMapping("/get/{id}")
    public ApiResult get (@PathVariable Long id) {

        LabelHierarchyInfo coreLabelSystemInfo = labelHierarchyInfoService.getById(id);
        return ApiResult.success(coreLabelSystemInfo);
    }

    @ApiOperation(value = "修改标签体系")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "标签体系ID", required = true, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "name", value = "标签体系名称", required = true, paramType = "query", dataType = "Integer")
    })
    @PostMapping("/edit")
    public ApiResult edit (@RequestBody @Valid LabelHierarchyInfo entity) {

        LabelHierarchyInfo coreLabelSystemInfo = labelHierarchyInfoService.getById(entity.getId());
        if(coreLabelSystemInfo == null) return ApiResult.failed("数据不存在");

        SysUser sysUser = redisSubject.getSysUser();
        coreLabelSystemInfo.setUpdatedBy(sysUser.getUsername());
        coreLabelSystemInfo.setOperate(Constants.Operate.UPDATE);
        coreLabelSystemInfo.setStatus(Constants.Status.DISABLED);
        coreLabelSystemInfo.setAuditState(Constants.AuditState.NOT_AUDIT);
        boolean save = labelHierarchyInfoService.updateById(coreLabelSystemInfo);
        return save ? ApiResult.success(entity.getId()) : ApiResult.failed();
    }

    @ApiOperation(value = "删除标签体系")
    @ApiImplicitParam(name = "id", value = "标签体系ID", required = true, paramType = "path", dataType = "Long")
    @DeleteMapping("/del/{id}")
    public ApiResult del (@PathVariable Long id) {

        LabelHierarchyInfo coreLabelSystemInfo = labelHierarchyInfoService.getById(id);
        if(coreLabelSystemInfo == null) return ApiResult.failed("数据不存在");

        SysUser sysUser = redisSubject.getSysUser();
        coreLabelSystemInfo.setUpdatedBy(sysUser.getUsername());

        coreLabelSystemInfo.setOperate(Constants.Operate.DELETE);
        coreLabelSystemInfo.setStatus(Constants.Status.DISABLED);
        coreLabelSystemInfo.setAuditState(Constants.AuditState.NOT_AUDIT);
        labelHierarchyInfoService.updateById(coreLabelSystemInfo);
        return ApiResult.success();
    }
}

