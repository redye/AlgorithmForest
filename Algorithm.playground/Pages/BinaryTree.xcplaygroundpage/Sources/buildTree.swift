import Foundation

/// 题目链接：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

/// 递归
/// 前序：根 -  左 - 右
/// 中序：左 - 根 - 右
/// 前序第一个元素是根结点
/// 中序根结点之前是左子树的中序序列，之后是右子树中序序列
/// 前序根结点之后左子树个数的前序序列，左子树之后是右子树的前序序列
public func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.count <= 0 || inorder.count <= 0 {
        return nil
    }
    
    let rootVal = preorder[0]
    let rootNode = TreeNode(rootVal)
    let midIndex = inorder.firstIndex(of: rootVal)!
    let leftInorder = inorder[0..<midIndex]
    let leftPreorder = preorder[1..<(midIndex + 1)]
    rootNode.left = buildTree(Array(leftPreorder), Array(leftInorder))
    if midIndex < inorder.count - 1 {
        let rightInorder = inorder[(midIndex + 1)..<inorder.count]
        let rightPreorder = preorder[(midIndex + 1)..<inorder.count]
        rootNode.right = buildTree(Array(rightPreorder), Array(rightInorder))
    }
    return rootNode
}
