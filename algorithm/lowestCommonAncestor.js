function TreeNode(val) {
    this.val = val
    this.left = this.right = null
}

/// 递归法
/// 时间复杂度 O(n) n 为二叉树的节点数，最坏情况下为每个结点都访问到
let lowestCommonAncestor = function(root, p, q) {
    if (!root || root === p || root === q) {
        return root
    } 
    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)

    let ancestor = (left && right) ? root : (left || right)
    return ancestor
}

/// 缓存每个叶子结点的父结点
/// p 所有 父结点的集合
/// 集合中第一与 q 父结点相同的值即为最近相同父祖先
let lowestCommonAncestor2 = function(root, p, q) {
    let stack = []
    let parent = {}

    stack.push(root)
    while (!parent[p] || !parent[q]) {
        let node = stack.pop()
        if (node.left) {
            parent[node.left] = node
            stack.push(node.left)
        }
        if (node.right) {
            parent[node.right] = node
            stack.push(node.right)
        }
    }

    let ancestorP = []
    while (!p) {
        ancestorP.push(p)
        p = parent[p]
    }

    while (ancestorP.indexOf(q) < 0) {
        q = parent[q]
    }
    return q
}