import Foundation

/// 题目链接： https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/

/// 递归法
/// p, q 在同一子树中
/// p, q 在不同子树中
public func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
    if root == nil || root === p || root === q {
        return root
    }
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    
    let ancestor = left == nil ? right : (right == nil ? left : root)
    return ancestor
}

/// 缓存每个叶子结点的父结点
/// p 所有 父结点的集合
/// 集合中第一与 q 父结点相同的值即为最近相同父祖先
public func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
    if root == nil {
        return nil
    }
    var stack: [TreeNode?] = [root]
    
    var parent = [TreeNode: TreeNode?]()
    
    while parent[p] == nil || parent[q] == nil {
        let cur = stack.removeLast()
        if cur?.left != nil {
            parent[(cur?.left)!] = cur
            stack.append(cur?.left)
        }
        if cur?.right != nil {
            parent[(cur?.right)!] = cur
            stack.append(cur?.right)
        }
    }
    
    var ancestorP = [TreeNode]()
    var p2: TreeNode? = p
    while p2 != nil {
        ancestorP.append(p2!)
        p2 = parent[p2!] ?? nil
    }
    var q2: TreeNode? = q
    while q2 != nil && !ancestorP.contains(q2!) {
        q2 = parent[q2!] ?? nil
    }
    return q2
}

