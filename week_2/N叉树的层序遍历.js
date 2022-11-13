
/**
 * 429. https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/
 * N叉树的层序遍历
 * 给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。
*/

// Definition for a Node.
function Node(val, children) {
    this.val = val
    this.children = children
}

/**
 * 迭代
 * BFS 广度优先搜索
*/
var levelOrder = function(root) {
    if (!root) {
        return []
    }
    let queue = [root]
    let result = []
    let level = 0
    while (queue.length > 0) {
        let i = 0
        let len = queue.length
        result[level] = []
        while (i < len) {
            let node = queue.shift()
            i ++
            result[level].push(node.val)
            if (node.children) {
                for (let i in node.children) {
                    queue.push(node.children[i])
                }
            }
        }
        level += 1
    }
    return result
}

/**
 * 递归
 * DFS 深度优先搜索
*/
var levelOrder2 = function(root) {
    if (!root) {
        return []
    }
    let result = []
    function innerOrder(root, level) {
        if (result.length == level) {
            result.push([])
        }
        result[level].push(root.val)
        if (root.children) {
            for (let i = 0; i < root.children.length; i++) {
                innerOrder(root.children[i], level + 1)
            }
        }
    }

    innerOrder(root, 0)
    return result
}
