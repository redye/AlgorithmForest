import Foundation

/// 题目链接：https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/
public func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var queue:[TreeNode] = [root!]
    var level = 0
    var levels = [[Int]]()
    while queue.count > 0 {
        levels.append([Int]())
        let count = queue.count
        for _ in 0..<count {
            let node = queue.removeFirst()
            levels[level].append(node.val)
            if let children = node.chileren {
                for child in children {
                    queue.append(child)
                }
            }
        }
        level += 1
    }
    return levels
}

/// 递归
public func levelOrders(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var levels = [[Int]]()
    
    func innerOrder(_ root: TreeNode?, _ level: Int) {
        if levels.count == level {
            levels.append([Int]())
        }
        levels[level].append(root!.val)
        if let children = root?.chileren {
            for x in children {
                innerOrder(x, level + 1)
            }
        }
    }
    innerOrder(root, 0)
    return levels
}
