import Foundation

/// 题目链接：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/

/// 递归法
public func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    let leftDepth = maxDepth(root?.left)
    let rightDepth = maxDepth(root?.right)
    let depth = leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1
    return depth
}

/// 栈
public func maxDepth2(_ root: TreeNode?) -> Int {
    var current = root
    if current == nil {
        return 0
    }
    var stack = [(TreeNode?, Int)]()
    var depth = 0
    stack.append((current, 1))
    while stack.count > 0 {
        let currentT = stack.removeLast()
        let currentDepath = currentT.1
        current = currentT.0
        if current != nil {
            depth = max(depth, currentDepath)
            stack.append((current?.left, currentDepath + 1))
            stack.append((current?.right, currentDepath + 1))
        }
    }
    return depth
}
