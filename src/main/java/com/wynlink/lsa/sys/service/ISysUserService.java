package com.wynlink.lsa.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wynlink.lsa.sys.model.SysUser;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ChenLong
 * @since 2020-09-28
 */
public interface ISysUserService extends IService<SysUser> {

    /**
     * 根据用户名查询用户信息
     * @param username
     * @return
     */
    SysUser getOneByUsername(String username);
}
