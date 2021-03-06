package com.wynlink.common.util;

import com.wynlink.common.pojo.Tree;

import java.util.ArrayList;
import java.util.List;

public class TreeUtil {

    public static List<Tree> getTreeData(List<Tree> trees){
        List<Tree> modelTrees=new ArrayList<>();
        for(Tree tree:trees) {
            if(tree.getParent()==null) {
                Tree modelTree=new Tree(tree.getId(), tree.getLabel(), tree.getParent());
                modelTree.setChildren(getChildrenNode(modelTree.getId(), trees));
                modelTrees.add(modelTree);
            }
        }

        return  modelTrees;
    }

    public static List<Tree> getChildrenNode(String value, List<Tree> trees) {
        List<Tree> modelTrees=new ArrayList<>();
        for (Tree tree:trees) {
            if(tree.getParent()==null){
                continue;
            }
            if(value.equals(tree.getParent())){
                Tree modelTree=new Tree(tree.getId(), tree.getLabel(), tree.getParent());
                modelTree.setChildren(getChildrenNode(tree.getId(), trees));
                modelTrees.add(modelTree);
            }
        }
        return modelTrees;
    }
}
