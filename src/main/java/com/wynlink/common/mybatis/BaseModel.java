package com.wynlink.common.mybatis;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@JsonIgnoreProperties(ignoreUnknown = true)
public class BaseModel<T> extends Model implements Serializable {

    /**
     * 是否分页
     */
    @TableField(exist = false)
    private boolean isPaging;

    /**
     *  当前页码
     */
    @TableField(exist = false)
    private int page;

    /**
     * 每页展示记录数
     */
    @TableField(exist = false)
    private int limit;

    /**
     * 排序字段名
     */
    @TableField(exist = false)
    private String column;

    /**
     * 排序方式: ASC / DESC
     */
    @TableField(exist = false)
    private String sort;

    /**
     * 设置页码，如果页码大于0 则默认开启分页
     * @param page
     */
    public void setPage(int page) {
        this.page = page;
        if(this.page > 0) {
            this.isPaging = true;
        }
    }

    @JsonIgnore
    public Page getIPage(){
        Page<T> iPage = new Page<>(this.page, this.limit);
        return iPage;
    }

    @JsonIgnore
    public QueryWrapper<T> getQueryWrapper(){
        QueryWrapper<T> wrapper = new QueryWrapper();

        // 如果排序字段不为空，则填入排序方式
        if(column != null && !column.trim().equals("")) {
            if("ASC".equalsIgnoreCase(this.sort)) {
                wrapper.orderByAsc(column);
            } else {
                wrapper.orderByDesc(column);
            }
        }
        return wrapper;
    }
}
