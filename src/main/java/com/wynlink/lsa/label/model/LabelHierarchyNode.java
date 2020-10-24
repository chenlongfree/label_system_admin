package com.wynlink.lsa.label.model;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDateTime;
import com.wynlink.common.mybatis.BaseModel;
import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 标签体系节点表
 * </p>
 *
 * @author ChenLong
 * @since 2020-10-22
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("t_label_hierarchy_node")
public class LabelHierarchyNode extends BaseModel<LabelHierarchyNode> {

    private static final long serialVersionUID=1L;

    @TableField(exist = false)
    private List<LabelHierarchyNode> children;

    @TableField(exist = false)
    private Integer notDelete;

    /**
     * 主键
     */
    private Long id;

    /**
     * 标签体系id
     */
    private Long infoId;

    /**
     * 上级id
     */
    private Long pid;

    /**
     * 标签名称
     */
    private String name;

    /**
     * 模型id
     */
    private Long modelId;

    /**
     * 模型参数id
     */
    private Long modelParamId;

    /**
     * 操作
     */
    private Integer operate;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    private String createdBy;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    private String updatedBy;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }


    @Override
    public QueryWrapper<LabelHierarchyNode> getQueryWrapper() {
        QueryWrapper<LabelHierarchyNode> queryWrapper = super.getQueryWrapper();
        if(this.id != null)
            queryWrapper.eq("id", this.id);
        if(this.infoId != null)
            queryWrapper.eq("info_id", this.infoId);
        if(this.pid != null)
            queryWrapper.eq("pid", this.pid);
        if(StrUtil.isNotBlank(this.name))
            queryWrapper.eq("name", this.name);
        if(this.modelId != null)
            queryWrapper.eq("model_id", this.modelId);
        if(this.modelParamId != null)
            queryWrapper.eq("model_param_id", this.modelParamId);
        if(this.operate != null)
            queryWrapper.eq("operate", this.operate);
        if(this.status != null)
            queryWrapper.eq("status", this.status);
        if(this.createTime != null)
            queryWrapper.eq("create_time", this.createTime);
        if(StrUtil.isNotBlank(this.createdBy))
            queryWrapper.eq("created_by", this.createdBy);
        if(this.updateTime != null)
            queryWrapper.eq("update_time", this.updateTime);
        if(StrUtil.isNotBlank(this.updatedBy))
            queryWrapper.eq("updated_by", this.updatedBy);
        if(notDelete != null && notDelete == 1) {
            queryWrapper.ne("status", 0);
        }
        return queryWrapper;
    }
}
