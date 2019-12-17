import Foundation

// 题目链接：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/

public func minDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    if root?.left == nil && root?.right == nil {
        return 1
    }
    var depth = 1
    if root?.left != nil {
        depth = min(minDepth(root?.left), depth)
    }
    if root?.right != nil {
        depth = min(minDepth(root?.right), depth)
    }
    
    return depth + 1
}

public func minDepth2(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    let leftDepth = minDepth(root?.left)
    let rightDepth = minDepth(root?.right)
    // 只有左子树或只有右子树
    if root?.left == nil || root?.right == nil {
        return 1 + leftDepth + rightDepth
    }
    // 有左右子树
    return 1 + min(leftDepth, rightDepth)
}


public func minDepth3(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    var stack: [(TreeNode?, Int)] = [(root, 1)]
    var minDepth = Int.max / 2
    while stack.count > 0 {
        let top = stack.removeFirst()
        let cur = top.0
        let curDepth = top.1
        if cur?.left == nil && cur?.right == nil {
            minDepth = min(curDepth, minDepth)
        }
        if root?.left != nil {
            stack.append((root?.left, curDepth + 1))
        }
        if root?.right != nil {
            stack.append((root?.right, curDepth + 1))
        }
    }
    return minDepth
}

public func minDepth4(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    var queue: [(TreeNode?, Int)] = [(root, 1)]
    var curDepth = 0
    while queue.count > 0 {
        let top = queue.removeFirst()
        let cur = top.0
        curDepth = top.1
        if cur?.left == nil && cur?.right == nil {
            break
        }
        if root?.left != nil {
            queue.append((root?.left, curDepth + 1))
        }
        if root?.right != nil {
            queue.append((root?.right, curDepth + 1))
        }
    }
    return curDepth
}
