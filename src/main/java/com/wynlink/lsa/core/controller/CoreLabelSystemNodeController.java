package com.wynlink.lsa.core.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wynlink.common.Constants;
import com.wynlink.common.pojo.ApiResult;
import com.wynlink.common.secure.RedisSubject;
import com.wynlink.lsa.core.model.CoreLabelSystemInfo;
import com.wynlink.lsa.core.model.CoreLabelSystemNode;
import com.wynlink.lsa.core.service.ICoreLabelSystemInfoService;
import com.wynlink.lsa.core.service.ICoreLabelSystemNodeService;
import com.wynlink.lsa.sys.model.SysUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 标签体系节点表 前端控制器
 * </p>
 *
 * @author ChenLong
 * @since 2020-09-30
 */
@Api("标签体系节点表 前端控制器")
@RestController
@RequestMapping("/core/label/system/node")
public class CoreLabelSystemNodeController {

    @Resource
    RedisSubject redisSubject;

    @Resource
    ICoreLabelSystemNodeService coreLabelSystemNodeService;

    @Resource
    ICoreLabelSystemInfoService coreLabelSystemInfoService;

    @ApiOperation(value = "查询标签体系下的所有节点")
    @ApiImplicitParam(name = "infoId", value = "标签体系Id", required = true, paramType = "path", dataType = "Integer")
    @GetMapping("/list/{infoId}")
    public ApiResult list (@PathVariable Long infoId) {

        CoreLabelSystemNode entity = new CoreLabelSystemNode();
        entity.setInfoId(infoId);
        List<CoreLabelSystemNode> list = coreLabelSystemNodeService.list(entity.getQueryWrapper());
        return ApiResult.success(list.size(), list);
    }

    @ApiOperation(value = "新增标签体系节点")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "infoId", value = "标签体系ID", required = true, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "pid", value = "上级节点ID", required = false, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "name", value = "节点名称", required = true, paramType = "query", dataType = "String"),
    })
    @PostMapping("/add")
    public ApiResult add (@RequestBody @Valid CoreLabelSystemNode entity) {

        int count = coreLabelSystemInfoService.count(new QueryWrapper<CoreLabelSystemInfo>().eq("id", entity.getInfoId()));
        if(count == 0) return ApiResult.failed("标签体系不存在");

        SysUser sysUser = redisSubject.getSysUser();
        entity.setCreatedBy(sysUser.getUsername());
        entity.setOperate(Constants.Operate.INSERT);
        entity.setStatus(Constants.Status.DISABLED);
        boolean save = coreLabelSystemNodeService.save(entity);
        return save ? ApiResult.success(entity.getId()) : ApiResult.failed();
    }

    @ApiOperation(value = "查询标签体系节点")
    @ApiImplicitParam(name = "id", value = "节点ID", required = true, paramType = "path", dataType = "Long")
    @GetMapping("/get/{id}")
    public ApiResult get (@PathVariable Long id) {

        CoreLabelSystemNode data = coreLabelSystemNodeService.getById(id);
        return ApiResult.success(data);
    }

    @ApiOperation(value = "修改标签体系节点")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "infoId", value = "标签体系ID", required = true, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "pid", value = "上级节点ID", required = false, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "name", value = "节点名称", required = true, paramType = "query", dataType = "String"),
    })
    @PostMapping("/edit")
    public ApiResult edit (@RequestBody @Valid CoreLabelSystemNode entity) {

        if(coreLabelSystemInfoService.getById(entity.getInfoId()) == null) return ApiResult.failed("标签体系不存在");
        if(coreLabelSystemNodeService.getById(entity.getId()) == null) return ApiResult.failed("节点不存在");

        SysUser sysUser = redisSubject.getSysUser();
        entity.setUpdatedBy(sysUser.getUsername());
        entity.setOperate(Constants.Operate.UPDATE);
        entity.setStatus(Constants.Status.DISABLED);
        boolean save = coreLabelSystemNodeService.updateById(entity);
        return save ? ApiResult.success(entity.getId()) : ApiResult.failed();
    }

    @ApiOperation(value = "删除标签体系节点")
    @ApiImplicitParam(name = "id", value = "标签体系ID", required = true, paramType = "path", dataType = "Long")
    @DeleteMapping("/del/{id}")
    public ApiResult del (@PathVariable Long id) {

        CoreLabelSystemNode byId = coreLabelSystemNodeService.getById(id);
        if(byId == null) return ApiResult.failed("数据不存在");

        SysUser sysUser = redisSubject.getSysUser();
        byId.setUpdatedBy(sysUser.getUsername());

        byId.setOperate(Constants.Operate.DELETE);
        byId.setStatus(Constants.Status.DISABLED);
        boolean b = coreLabelSystemNodeService.updateById(byId);
        return b ? ApiResult.success(id) : ApiResult.failed();
    }
}

