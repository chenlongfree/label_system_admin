package com.wynlink.lsa.label.controller;


import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wynlink.common.Constants;
import com.wynlink.common.pojo.ApiResult;
import com.wynlink.common.pojo.Tree;
import com.wynlink.common.secure.RedisSubject;
import com.wynlink.common.util.TreeUtil;
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
import java.util.ArrayList;
import java.util.List;

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

    @Resource
    ILabelHierarchyNodeService labelHierarchyNodeService;

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

        LabelHierarchyInfo info = labelHierarchyInfoService.getById(id);
        info.setNodes(new ArrayList<>());

        LabelHierarchyNode query = new LabelHierarchyNode();
        query.setInfoId(id);
        query.setNotDelete(1);
        List<LabelHierarchyNode> nodes = labelHierarchyNodeService.list(query.getQueryWrapper());
        for (LabelHierarchyNode node : nodes) {
            if(node.getPid() == null) {
                node.setChildren(getChildrenNode(node.getId(), nodes));
                info.getNodes().add(node);
            }
        }
        return ApiResult.success(info);
    }

    @ApiOperation(value = "查询树桩层次结构标签体系")
    @ApiImplicitParam(name = "id", value = "标签体系ID", required = true, paramType = "path", dataType = "Long")
    @GetMapping("/tree/{id}")
    public ApiResult tree (@PathVariable Long id) {

        List<Tree> trees = new ArrayList<>();
        if(id != null) {
            LabelHierarchyNode query = new LabelHierarchyNode();
            query.setInfoId(id);
            query.setNotDelete(1);
            List<LabelHierarchyNode> nodes = labelHierarchyNodeService.list(query.getQueryWrapper());
            for (LabelHierarchyNode node : nodes) {
                trees.add(new Tree(node.getId().toString(), node.getName(),  Convert.toStr(node.getPid(), null)));
            }
        }
        trees = TreeUtil.getTreeData(trees);
        return ApiResult.success(trees);
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

    private List<LabelHierarchyNode> getChildrenNode(Long value, List<LabelHierarchyNode> nodes) {
        List<LabelHierarchyNode> children = new ArrayList<>();
        for (LabelHierarchyNode node : nodes) {
            if(node.getPid()==null){
                continue;
            }
            if(value.equals(node.getPid())){
                node.setChildren(getChildrenNode(node.getId(), nodes));
                children.add(node);
            }
        }
        return children;
    }
}

