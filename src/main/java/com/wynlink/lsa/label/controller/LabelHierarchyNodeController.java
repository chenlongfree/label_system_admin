package com.wynlink.lsa.label.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wynlink.common.Constants;
import com.wynlink.common.pojo.ApiResult;
import com.wynlink.common.secure.RedisSubject;
import com.wynlink.lsa.label.model.LabelHierarchyInfo;
import com.wynlink.lsa.label.model.LabelHierarchyNode;
import com.wynlink.lsa.label.service.ILabelHierarchyInfoService;
import com.wynlink.lsa.label.service.ILabelHierarchyNodeService;
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
 * @since 2020-10-22
 */
@Api("标签体系节点表 前端控制器")
@RestController
@RequestMapping("/label/hierarchy/node")
public class LabelHierarchyNodeController {

    @Resource
    RedisSubject redisSubject;

    @Resource
    ILabelHierarchyInfoService labelHierarchyInfoService;

    @Resource
    ILabelHierarchyNodeService labelHierarchyNodeService;

    @ApiOperation(value = "查询标签体系下的所有节点")
    @ApiImplicitParam(name = "infoId", value = "标签体系Id", required = true, paramType = "path", dataType = "Integer")
    @GetMapping("/list/{infoId}")
    public ApiResult list (@PathVariable Long infoId) {

        LabelHierarchyNode entity = new LabelHierarchyNode();
        entity.setInfoId(infoId);
        List<LabelHierarchyNode> list = labelHierarchyNodeService.list(entity.getQueryWrapper());
        return ApiResult.success(list.size(), list);
    }

    @ApiOperation(value = "新增标签体系节点")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "infoId", value = "标签体系ID", required = true, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "pid", value = "上级节点ID", required = false, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "name", value = "节点名称", required = true, paramType = "query", dataType = "String"),
    })
    @PostMapping("/add")
    public ApiResult add (@RequestBody @Valid LabelHierarchyNode entity) {

        int count = labelHierarchyInfoService.count(new QueryWrapper<LabelHierarchyInfo>().eq("id", entity.getInfoId()));
        if(count == 0) return ApiResult.failed("标签体系不存在");

        SysUser sysUser = redisSubject.getSysUser();
        entity.setCreatedBy(sysUser.getUsername());
        entity.setOperate(Constants.Operate.INSERT);
        entity.setStatus(Constants.Status.DISABLED);
        boolean save = labelHierarchyNodeService.save(entity);
        return save ? ApiResult.success(entity.getId()) : ApiResult.failed();
    }

    @ApiOperation(value = "查询标签体系节点")
    @ApiImplicitParam(name = "id", value = "节点ID", required = true, paramType = "path", dataType = "Long")
    @GetMapping("/get/{id}")
    public ApiResult get (@PathVariable Long id) {

        LabelHierarchyNode data = labelHierarchyNodeService.getById(id);
        return ApiResult.success(data);
    }

    @ApiOperation(value = "修改标签体系节点")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "infoId", value = "标签体系ID", required = true, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "pid", value = "上级节点ID", required = false, paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "name", value = "节点名称", required = true, paramType = "query", dataType = "String"),
    })
    @PostMapping("/edit")
    public ApiResult edit (@RequestBody @Valid LabelHierarchyNode entity) {

        if(labelHierarchyInfoService.getById(entity.getInfoId()) == null) return ApiResult.failed("标签体系不存在");
        if(labelHierarchyNodeService.getById(entity.getId()) == null) return ApiResult.failed("节点不存在");

        SysUser sysUser = redisSubject.getSysUser();
        entity.setUpdatedBy(sysUser.getUsername());
        entity.setOperate(Constants.Operate.UPDATE);
        entity.setStatus(Constants.Status.DISABLED);
        boolean save = labelHierarchyNodeService.updateById(entity);
        return save ? ApiResult.success(entity.getId()) : ApiResult.failed();
    }

    @ApiOperation(value = "删除标签体系节点")
    @ApiImplicitParam(name = "id", value = "标签体系ID", required = true, paramType = "path", dataType = "Long")
    @DeleteMapping("/del/{id}")
    public ApiResult del (@PathVariable Long id) {

        LabelHierarchyNode byId = labelHierarchyNodeService.getById(id);
        if(byId == null) return ApiResult.failed("数据不存在");

        SysUser sysUser = redisSubject.getSysUser();
        byId.setUpdatedBy(sysUser.getUsername());

        byId.setOperate(Constants.Operate.DELETE);
        byId.setStatus(Constants.Status.DISABLED);
        boolean b = labelHierarchyNodeService.updateById(byId);
        return b ? ApiResult.success(id) : ApiResult.failed();
    }
}

