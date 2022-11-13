import Foundation

/**
 * 栈递归
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */

/*
 栈 s
 p = root
 while p || s 不空 {
    while p {
        访问 p
        p.right 入栈
        p = p.left
    }
    p = s.top 出栈
    访问 p
    p = p.right
 }
 */
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var cur = root
    var stack = [TreeNode?]()
    var res = [Int]()
    while cur != nil || stack.count != 0 {
        while cur != nil {
            res.append(cur!.val)
            stack.append(cur?.right)
            cur = cur?.left
        }
        cur = stack.removeLast()
    }
    
    return res
}
