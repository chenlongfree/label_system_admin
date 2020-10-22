package com.wynlink.common;

/**
 * 全局静态变量类
 */
public class Constants {

    public static final String HEADER_TOKEN = "X-Token";

    /**
     * 状态
     */
    public static class Status{
        public static final Integer DELETED = 0; // 删除
        public static final Integer ENABLED = 1; // 启用
        public static final Integer DISABLED = 2; // 禁用
    }

    /**
     * 审核状态
     */
    public static class AuditState{
        public static final Integer NOT_AUDIT = 0; // 待审核
        public static final Integer HAS_AUDITED = 1; // 已审核
        public static final Integer RETURNED = 2; // 退回
        public static final Integer NOT_PASS = -1; // 审核不通过
    }

    /**
     * 操作类型
     */
    public static class Operate{
        public static final Integer INSERT = 1; // 新增
        public static final Integer UPDATE = 2; // 修改
        public static final Integer DELETE = 3; // 删除
    }
}
