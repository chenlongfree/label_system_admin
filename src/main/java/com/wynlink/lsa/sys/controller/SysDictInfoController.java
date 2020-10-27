package com.wynlink.lsa.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wynlink.common.pojo.ApiResult;
import com.wynlink.common.pojo.Tree;
import com.wynlink.common.redis.RedisService;
import com.wynlink.common.util.TreeUtil;
import com.wynlink.lsa.sys.model.SysDictItem;
import com.wynlink.lsa.sys.service.ISysDictInfoService;
import com.wynlink.lsa.sys.service.ISysDictItemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.*;

/**
 * <p>
 * 字典表 前端控制器
 * </p>
 *
 * @author ChenLong
 * @since 2020-10-22
 */
@Api("字典管理接口")
@RestController
@RequestMapping("/sys/dict")
public class SysDictInfoController {

    @Resource
    ISysDictItemService sysDictItemService;

    @Resource
    RedisService redisService;

    @ApiOperation(value = "获取字典树桩结构")
    @ApiImplicitParam(name = "dictCode", value = "字典编码", required = true, paramType = "path", dataType = "String")
    @GetMapping("/tree/{dictCode}")
    public ApiResult tree(@PathVariable String dictCode) {

        List<Tree> treeData = (List<Tree>) redisService.get("tree:"+dictCode);
        if(treeData == null) {
            List<SysDictItem> dict_code = sysDictItemService.list(new QueryWrapper<SysDictItem>().eq("dict_code", dictCode));
            List<Tree> trees = new ArrayList<>();
            for (SysDictItem sysDictItem : dict_code) {
                Tree tree = new Tree();
                tree.setId(sysDictItem.getName());
                tree.setLabel(sysDictItem.getCode());
                tree.setParent(sysDictItem.getPcode());
                tree.setSort(sysDictItem.getSequence());
                trees.add(tree);
            }
            trees.sort(Comparator.comparing(Tree::getSort));
            treeData = TreeUtil.getTreeData(trees);

            redisService.set("tree:"+dictCode, treeData);
        }
        return ApiResult.success(treeData.size(), treeData);
    }

    @ApiOperation(value = "获取全部字典项")
    @ApiImplicitParam(name = "dictCode", value = "字典编码", required = true, paramType = "path", dataType = "String")
    @GetMapping("/map/{dictCode}")
    public ApiResult dictMap(@PathVariable String dictCode) {

        Map<String, Object> map = (Map<String, Object>) redisService.get("dict:"+dictCode);
        if(map == null) {
            List<SysDictItem> dict_code = sysDictItemService.list(new QueryWrapper<SysDictItem>().eq("dict_code", dictCode));
            map = new HashMap<>();
            for (SysDictItem sysDictItem : dict_code) {
                map.put(sysDictItem.getCode(), sysDictItem.getName());
            }
        }
        return ApiResult.success(map.size(), map);
    }
}