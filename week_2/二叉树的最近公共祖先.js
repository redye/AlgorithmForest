
/**
 * 236. https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 * 二叉树的最近公共祖先
 * 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 * 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。
 */


 /**
  * Definition for a binary tree node.
 */
function TreeNode(val) {
    this.val = val
    this.left = this.right = null
}
 

var lowestCommonAncestor = function(root, p, q) {
    if (!root || root === p || root === q) {
        return root
    }
    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)
    let ancestor = (left && right) ? root : (left || right)

    return ancestor
}

var lowestCommonAncestor2 = function(root, p, q) {
    if (!root) {
        return nil
    }
    let stack = [root]
    let parent = {}
    while (!parent(p) || !parent(q)) {
        let top = stack.pop()
        if (top.left) {
            parent[top.left] = top
            stack.push(top.left)
        }
        if (top.right) {
            parent[top.right] = top
            stack.push(top.right)
        }
    }
    let ancestorP = []
    while (!p) {
        ancestorP.push(p)
        p = parent[p]
    }

    while(ancestorP.indexOf(q) < 0) {
        q = parent[q]
    }
    return q
}