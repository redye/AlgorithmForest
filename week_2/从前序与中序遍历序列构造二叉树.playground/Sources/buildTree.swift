import Foundation

public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.count == 0 || inorder.count == 0 {
        return nil
    }
    let rootVal = preorder[0]
    let midIndex = inorder.firstIndex(of: rootVal)!
    let root = TreeNode(rootVal)
    let leftInorder = inorder[0..<midIndex]
    let leftPreorder = preorder[1..<(midIndex + 1)]
    root.left = buildTree(Array(leftPreorder), Array(leftInorder))
    if midIndex < inorder.count - 1 {
        let rightPreorder = preorder[(midIndex + 1)..<preorder.count]
        let rightInorder = inorder[(midIndex + 1)..<inorder.count]
        root.right = buildTree(Array(rightPreorder), Array(rightInorder))
    }
    
    return root
}
