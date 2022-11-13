
/**
 * 595. https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/
 * N叉树的后序遍历
 * 给定一个 N 叉树，返回其节点值的后序遍历。
*/

// Definition for a Node.
function Node(val, children) {
    this.val = val
    this.children = children
}

/**
 * 递归
*/
var postorder = function(root) {
    if (!root) {
        return []
    }
    let result = []
    let cur = [root.val]
    if (root.children) {
        for (let i = 0; i < root.children.length; i ++) {
            let child = postorder(root.children[i])
            result = result.concat(child)
        }
    }
    result = result.concat(cur)
    return result
}

/**
 * 迭代 
 */ 

var postorder2 = function(root) {
    if (!root) {
        return []
    }
    let stack = [root]
    let result = []
    while (stack.length > 0) {
        let top = stack.pop()
        result.push(top.val)
        let children = top.children 
        if (children) {
            for (let i in children) {
                stack.push(children[i])
            }
        }
    }
    return result.reverse()
}