package com.wynlink.lsa.sys.model;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wynlink.common.mybatis.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author ChenLong
 * @since 2020-09-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("t_sys_user")
public class SysUser extends BaseModel<SysUser> {

    private static final long serialVersionUID=1L;

    /**
     * 用户登录Token
     */
    @TableField(exist = false)
    private String token;

    /** 角色集合 */
    @TableField(exist = false)
    private List<String> roles;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户名
     */
    @NotEmpty(message = "用户名不能为空")
    private String username;

    /**
     * 密码
     */
    @NotEmpty(message = "密码不能为空")
    @Size(min = 6, max = 20, message = "密码长度：6-20位")
    private String password;

    /** 头像 */
    private String avatar;

    /**
     * 真实姓名
     */
    private String realname;

    /**
     * 是否是超级管理员， 0-否，1-是
     */
    private Boolean isAdmin;

    private Boolean isDel;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 创建人
     */
    private String createBy;

    private LocalDateTime updateTime;

    /**
     * 创建人
     */
    private String updateBy;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }


    @Override
    public QueryWrapper<SysUser> getQueryWrapper() {
        QueryWrapper<SysUser> queryWrapper = super.getQueryWrapper();
        if(this.id != null)
            queryWrapper.eq("id", this.id);
        if(StrUtil.isNotBlank(this.username))
            queryWrapper.eq("username", this.username);
        if(StrUtil.isNotBlank(this.password))
            queryWrapper.eq("password", this.password);
        if(StrUtil.isNotBlank(this.realname))
            queryWrapper.eq("realname", this.realname);
        if(this.isAdmin != null)
            queryWrapper.eq("is_admin", this.isAdmin);
        if(this.createTime != null)
            queryWrapper.eq("create_time", this.createTime);
        if(StrUtil.isNotBlank(this.createBy))
            queryWrapper.eq("create_by", this.createBy);
        if(this.updateTime != null)
            queryWrapper.eq("update_time", this.updateTime);
        if(StrUtil.isNotBlank(this.updateBy))
            queryWrapper.eq("update_by", this.updateBy);
        return queryWrapper;
    }
}
