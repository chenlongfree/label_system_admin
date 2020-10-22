package com.wynlink.lsa.sys.model;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDateTime;
import com.wynlink.common.mybatis.BaseModel;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 字典项表
 * </p>
 *
 * @author ChenLong
 * @since 2020-10-22
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("t_sys_dict_item")
public class SysDictItem extends BaseModel<SysDictItem> {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 上级编码
     */
    private String pcode;

    /**
     * 字典项编码
     */
    private String code;

    /**
     * 字典编码
     */
    private String dictCode;

    /**
     * 字典项名称
     */
    private String name;

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
    public QueryWrapper<SysDictItem> getQueryWrapper() {
        QueryWrapper<SysDictItem> queryWrapper = super.getQueryWrapper();
        if(this.id != null)
            queryWrapper.eq("id", this.id);
        if(StrUtil.isNotBlank(this.pcode))
            queryWrapper.eq("pcode", this.pcode);
        if(StrUtil.isNotBlank(this.code))
            queryWrapper.eq("code", this.code);
        if(StrUtil.isNotBlank(this.dictCode))
            queryWrapper.eq("dict_code", this.dictCode);
        if(StrUtil.isNotBlank(this.name))
            queryWrapper.eq("name", this.name);
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
