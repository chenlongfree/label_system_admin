package com.wynlink.common.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tree implements Serializable {
    private String label;
    private String id;
    private String parent;
    private Integer sort;

    private List<Tree> children;

    public Tree(String id, String label, String parent){
        this.id = id;
        this.label = label;
        this.parent = parent;
    }
}
