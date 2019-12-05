import Foundation

/// 题目链接： https://leetcode-cn.com/problems/binary-tree-postorder-traversal/

/// 递归法
public func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let cur = root else {
        return []
    }
    let val = [cur.val]
    let left = postorderTraversal(cur.left)
    let right = postorderTraversal(cur.right)
    
    return left + right + val
}


/// 左 - 右 -根
/// 根 - 右 -左 的 reverse
/// 访问当前节点 - 左节点入栈 - 当前节点=当前节点的右节点
/// 栈弹出
public func postorderTraversal2(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    
    var stack = [TreeNode?]()
    var cur = root
    while cur != nil || stack.count > 0 {
        while cur != nil {
            result.append(cur!.val)
            stack.append(cur?.left)
            cur = cur?.right
        }
        cur = stack.removeLast()
    }
    
    return result.reversed()
}


/// treenode 需要是可 hash 的
public func postorderTraversal3(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    var stack = [TreeNode]()
    var done = [Int: Bool]()
    var cur = root
    while cur != nil || stack.count > 0 {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.left
        }
        while stack.count > 0 && done[stack[stack.count - 1].val] == true {
            let pop = stack.removeLast()
            result.append(pop.val)
        }
        if stack.count > 0 {
            let top = stack[stack.count - 1]
            cur = top.right
            done[top.val] = true
        }
    }
    
    return result
}
