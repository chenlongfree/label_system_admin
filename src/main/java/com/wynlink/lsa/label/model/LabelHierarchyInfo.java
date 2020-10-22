package com.wynlink.lsa.label.model;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wynlink.common.mybatis.BaseModel;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 标签体系表
 * </p>
 *
 * @author ChenLong
 * @since 2020-10-22
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("t_label_hierarchy_info")
public class LabelHierarchyInfo extends BaseModel<LabelHierarchyInfo> {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 标签体系名称
     */
    private String name;

    /**
     * 审核状态
     */
    private Integer auditState;

    /**
     * 操作
     */
    private Integer operate;

    /**
     * 状态,0-启用，1-禁用，-1-删除
     */
    private Integer status;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    private String createdBy;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;

    private String updatedBy;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }


    @Override
    public QueryWrapper<LabelHierarchyInfo> getQueryWrapper() {
        QueryWrapper<LabelHierarchyInfo> queryWrapper = super.getQueryWrapper();
        if(this.id != null)
            queryWrapper.eq("id", this.id);
        if(StrUtil.isNotBlank(this.name))
            queryWrapper.eq("name", this.name);
        if(this.auditState != null)
            queryWrapper.eq("audit_state", this.auditState);
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
        return queryWrapper;
    }
}
