import Foundation

/// 题目链接：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

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
