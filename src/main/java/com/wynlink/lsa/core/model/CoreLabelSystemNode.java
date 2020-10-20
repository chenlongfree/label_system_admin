package com.wynlink.lsa.core.model;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDateTime;
import com.wynlink.common.mybatis.BaseModel;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 标签体系节点表
 * </p>
 *
 * @author ChenLong
 * @since 2020-09-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("t_core_label_system_node")
public class CoreLabelSystemNode extends BaseModel<CoreLabelSystemNode> {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 标签体系id
     */
    @NotNull
    private Long infoId;

    /**
     * 标签性质
     */
    private String nature;

    /**
     * 上级id
     * 更新时忽律null值判断
     */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private Long pid;

    /**
     * 标签名称
     */
    @NotNull
    private String name;

    /**
     * 模型id
     */
    private Long modelId;

    /**
     * 模型参数id
     */
    private Long modelParamId;

    private Integer operate;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 创建时间
     */
    private LocalDateTime createdAt;

    private String createdBy;

    /**
     * 更新时间
     */
    private LocalDateTime updatedAt;

    private String updatedBy;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }


    @Override
    public QueryWrapper<CoreLabelSystemNode> getQueryWrapper() {
        QueryWrapper<CoreLabelSystemNode> queryWrapper = super.getQueryWrapper();
        if(this.id != null)
            queryWrapper.eq("id", this.id);
        if(this.infoId != null)
            queryWrapper.eq("info_id", this.infoId);
        if(StrUtil.isNotBlank(this.nature))
            queryWrapper.eq("nature", this.nature);
        if(this.pid != null)
            queryWrapper.eq("pid", this.pid);
        if(StrUtil.isNotBlank(this.name))
            queryWrapper.eq("name", this.name);
        if(this.modelId != null)
            queryWrapper.eq("model_id", this.modelId);
        if(this.modelParamId != null)
            queryWrapper.eq("model_param_id", this.modelParamId);
        if(this.status != null)
            queryWrapper.eq("status", this.status);
        if(this.createdAt != null)
            queryWrapper.eq("created_at", this.createdAt);
        if(StrUtil.isNotBlank(this.createdBy))
            queryWrapper.eq("created_by", this.createdBy);
        if(this.updatedAt != null)
            queryWrapper.eq("updated_at", this.updatedAt);
        if(StrUtil.isNotBlank(this.updatedBy))
            queryWrapper.eq("updated_by", this.updatedBy);
        return queryWrapper;
    }
}
