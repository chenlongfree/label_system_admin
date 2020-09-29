package com.wynlink.lsa.sys.service.impl;

import com.wynlink.lsa.sys.model.SysUser;
import com.wynlink.lsa.sys.mapper.SysUserMapper;
import com.wynlink.lsa.sys.service.ISysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ChenLong
 * @since 2020-09-28
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

    @Override
    public SysUser getOneByUsername(String username) {
        SysUser sysUser = new SysUser();
        sysUser.setUsername(username);
        sysUser.setIsDel(false);
        return this.getOne(sysUser.getQueryWrapper());
    }
}
