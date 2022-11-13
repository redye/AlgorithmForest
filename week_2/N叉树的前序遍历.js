
/**
 * 589. https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
 * N叉树的前序遍历
 * 给定一个 N 叉树，返回其节点值的前序遍历。
*/

// Definition for a Node.
function Node(val, children) {
    this.val = val
    this.children = children
}

/*
 * 递归
*/
var preorder = function(root) {
    if (!root) {
        return []
    }
    let result = [root.val]
    if (root.children) {
        for (let i = 0; i < root.children.length; i ++) {
            let child = preorder(root.children[i])
            result = result.concat(child)
        }
    }
    return result
}

var preorder2 = function(root) {
    if (!root) {
        return []
    }

    let result = []
    let stack = [root]
    while (stack.length > 0) {
        let top = stack.pop()
        result.push(top.val)
        if (top.children) {
            let i = top.children.length - 1
            while (i >= 0) {
                stack.push(top.children[i--])
            }
        }
    }
    return result
}