import Foundation

/// 题目链接: https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/

/// 递归法
public func preorder(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    guard let curNode = root else {
        return []
    }
    let cur = [curNode.val]
    guard let children = curNode.chileren else {
        return cur
    }
    var result = cur
    for x in children {
        let child = preorder(x)
        result += child
    }
    return result
}

/// 迭代法
/// 根 - 孩子节点
public func preorder2(_ root: TreeNode?) -> [Int] {
    guard let curNode = root else {
        return []
    }
    var stack = [curNode]
    var result = [Int]()
    
    while stack.count > 0 {
        let top = stack.removeLast()
        result.append(top.val)
        if let children = top.chileren {
            var i = children.count - 1
            while i >= 0 {
                stack.append(children[i])
                i -= 1
            }
        }
    }
    
    
    return result
}
