import Foundation

/// 前序遍历
/// 访问当前节点 右子树入栈   当前节点=当前节点的左子树
/// 右节点 pop
public func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    
    var cur = root
    var stack = [TreeNode?]()
    
    while cur != nil || stack.count > 0 {
        while cur != nil {
            result.append(cur!.val)
            stack.append(cur?.right)
            cur = cur?.left
        }
        cur = stack.removeLast()
    }
    
    return result
}


/// 递归法
public func preorderTraversal2(_ root: TreeNode?) -> [Int] {
    guard let cur = root else {
        return []
    }
    let val = [cur.val]
    let left = preorderTraversal2(cur.left)
    let right = preorderTraversal2(cur.right)
    
    return val + left + right
}
