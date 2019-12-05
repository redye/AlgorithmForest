import Foundation

/// 题目链接：https://leetcode-cn.com/problems/binary-tree-inorder-traversal/

/// 中序遍历 左子树 根节点 右子树
/// 前序遍历 根节点 左子树 右子树
/// 后序遍历 左子树 右子树 根节点

/// 递归法
/// 时间复杂度 O(n)
/// 最坏情况下需要空间 O(n)，平均情况为 O(logn)
public func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let rootNode = root else {
        return []
    }
    let left = inorderTraversal(rootNode.left)
    let val = [rootNode.val]
    let right = inorderTraversal(rootNode.right)
    let result = left + val + right
    return result
}

/// 栈：根节点入栈 当前节点=当前节点的左子树
/// 时间复杂度 O(nk)
/// 空间复杂度 O(n)
public func inorderTraversal2(_ root: TreeNode?) -> [Int] {
    var current = root
    var stack = [TreeNode]()
    var result = [Int]()
    while current != nil || stack.count > 0 {
        while current != nil {
            stack.append(current!)
            current = current?.left
        }
        current = stack.removeLast()
        result.append(current!.val)
        current = current?.right
    }
    return result
}

