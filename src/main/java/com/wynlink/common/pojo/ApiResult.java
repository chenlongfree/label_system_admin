package com.wynlink.common.pojo;

import cn.hutool.json.JSONUtil;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
@ApiModel("返回响应数据")
public class ApiResult implements Serializable {

    public static int SC_SUCCESS = 0; // 成功=0；
    public static int SC_FAILED = 1; // 失败=1；
    public static int SC_CONTINUE = 100; // 继续=100；
    public static int SC_SWITCHING_PROTOCOLS = 101; // 交换协议=101；
    public static int SC_OK = 200; // 正常=200；
    public static int SC_CREATED = 201; // 创建=201；
    public static int SC_ACCEPTED = 202; // 接受=202；
    public static int SC_NON_AUTHORITATIVE_INFORMATION = 203; // 非权威信息=203；
    public static int SC_NO_CONTENT = 204; // 无含量=204；
    public static int SC_RESET_CONTENT = 205; // 重置内容=205；
    public static int SC_PARTIAL_CONTENT = 206; // 部分_含量=206；
    public static int SC_MULTIPLE_CHOICES = 300; // 多项选择=300；
    public static int SC_MOVED_PERMANENTLY = 301; // 永久移动=301；
    public static int SC_MOVED_TEMPORARILY = 302; // 暂时移动=302；
    public static int SC_FOUND = 302; // 发现=302；
    public static int SC_SEE_OTHER = 303; // 见其他=303；
    public static int SC_NOT_MODIFIED = 304; // 未修改=304；
    public static int SC_USE_PROXY = 305; // 使用代理=305；
    public static int SC_TEMPORARY_REDIRECT = 307; // 临时重定向=307；
    public static int SC_BAD_REQUEST = 400; // 错误的请求=400；
    public static int SC_UNAUTHORIZED = 401; // 未授权=401；
    public static int SC_PAYMENT_REQUIRED = 402; // 付款要求=402；
    public static int SC_FORBIDDEN = 403; // 禁止=403；
    public static int SC_NOT_FOUND = 404; // 未找到=404；
    public static int SC_METHOD_NOT_ALLOWED = 405; // 方法不允许=405；
    public static int SC_NOT_ACCEPTABLE = 406; // 不可接受=406；
    public static int SC_PROXY_AUTHENTICATION_REQUIRED = 407; // 代理身份验证要求=407；
    public static int SC_REQUEST_TIMEOUT = 408; // 请求超时=408；
    public static int SC_CONFLICT = 409; // 冲突=409；
    public static int SC_GONE = 410; // 消失=410；
    public static int SC_LENGTH_REQUIRED = 411; // 所需长度=411；
    public static int SC_PRECONDITION_FAILED = 412; // 预处理失败=412；
    public static int SC_REQUEST_ENTITY_TOO_LARGE = 413; // 请求实体太大=413；
    public static int SC_REQUEST_URI_TOO_LONG = 414; // 请求URI_TOO_LONG=414；
    public static int SC_UNSUPPORTED_MEDIA_TYPE = 415; // 不支持的媒体类型=415；
    public static int SC_REQUESTED_RANGE_NOT_SATISFIABLE = 416; // 请求范围不可满足=416；
    public static int SC_EXPECTATION_FAILED = 417; // 预期失败=417；
    public static int SC_INTERNAL_SERVER_ERROR = 500; // 内部服务器错误=500；
    public static int SC_NOT_IMPLEMENTED = 501; // 未实现=501；
    public static int SC_BAD_GATEWAY = 502; // 坏网关=502；
    public static int SC_SERVICE_UNAVAILABLE = 503; // 服务不可用=503；
    public static int SC_GATEWAY_TIMEOUT = 504; // 网关超时=504；
    public static int SC_HTTP_VERSION_NOT_SUPPORTED = 505; // 不支持HTTP_VERSION_=505；

    @ApiModelProperty(value = "错误信息")
    private String msg;

    @ApiModelProperty(value = "是否成功")
    private boolean success;

    @ApiModelProperty(value = "错误编号")
    private int code;

    @ApiModelProperty(value = "数据记录数")
    private long count;

    @ApiModelProperty(value = "返回对象")
    private Object data;

    public static ApiResult success(){
        ApiResult rs = new ApiResult();
        rs.setMsg("处理正常");
        rs.setCode(SC_SUCCESS);
        rs.setSuccess(true);
        return rs;
    }

    public static ApiResult success(Object data){
        ApiResult rs = success();
        rs.setCount(1);
        rs.setData(data);
        return rs;
    }

    public static ApiResult success(long count, Object data){
        ApiResult rs = success(data);
        rs.setCount(count);
        return rs;
    }

    public static ApiResult failed(){
        ApiResult rs = new ApiResult();
        rs.setMsg("处理失败");
        rs.setCode(SC_FAILED);
        rs.setSuccess(false);
        return rs;
    }

    public static ApiResult failed(String msg){
        ApiResult rs = failed();
        rs.setMsg(msg);
        return rs;
    }

    public static ApiResult failed(String msg, int code){
        ApiResult rs = failed(msg);
        rs.setCode(code);
        return rs;
    }

    public static ApiResult exception(String msg){
        ApiResult rs = new ApiResult();
        rs.setCode(SC_EXPECTATION_FAILED);
        rs.setSuccess(false);
        rs.setMsg(msg);
        return rs;
    }

    public String toJSONString () {
        return JSONUtil.toJsonStr(this);
    }
}
