import Foundation

/// 题目链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal/

/// 递归
public func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let cur = root else {
        return []
    }
    var levels = [[Int]]()
    func innerOrder(_ root: TreeNode?, level: Int) {
        if levels.count == level {
            levels.append([])
        }
        levels[level].append(root!.val)
        if root?.left != nil {
            innerOrder(root?.left, level: level + 1)
        }
        if root?.right != nil {
            innerOrder(root?.right, level: level + 1)
        }
    }
    
    innerOrder(root, level: 0)
    
    return levels
}


/// 迭代
/// 队列：先进先出
public func levelOrder2(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var levels = [[Int]]()
    
    var queue = [root!]
    var level = 0
    while queue.count > 0 {
        levels.append([])
        let count = queue.count
        for _ in 0..<count {
            let node = queue.removeFirst()
            levels[level].append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        level += 1
    }
    
    return levels
}
