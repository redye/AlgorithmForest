import Foundation

/**
 * 94. https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
 * 二叉树的中序遍历
 * 给定一个二叉树，返回它的中序 遍历。
 */

/**
 * 二叉树的遍历：
 * 1. 前序遍历：根 -> 左子树 -> 右子树
 * 2. 中序遍历：左子树 -> 根 -> 右子树
 * 3. 后续遍历：左子树 -> 右子树 -> 根
 */

/**
 * 递归
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let rootNode = root else {
        return []
    }
    let left = inorderTraversal(rootNode.left)
    let rootVal = [rootNode.val]
    let right = inorderTraversal(rootNode.right)
    
    return left + rootVal + right
}


/*
 栈S;
 p= root;
 while(p || S不空){
     while(p){
         p入S;
         p = p的左子树;
     }
     p = S.top 出栈;
     访问p;
     p = p的右子树;
 }
 */

/**
 * 栈遍历
 *
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
func inorderTraversal2(_ root: TreeNode?) -> [Int] {
    var current = root
    var stack = [TreeNode]()
    var res = [Int]()
    while current != nil || stack.count != 0 {
        if current == nil {
            stack.append(current!)
            current = current?.left
        }
        current = stack.removeLast()
        res.append(current!.val)
        current = current!.right
    }
    return res
}
