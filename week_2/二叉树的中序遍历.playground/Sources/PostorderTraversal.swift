import Foundation

/**
 * 栈递归
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 * 左 -> 右 -> 根
 * 右 -> 左 -> 根  然后翻转数组
 */

/*
 栈 s
 p = root
 while p || s 不空 {
    while p {
        访问 p
        p.left 入栈
        p = p.right
    }
    p = s.top 出栈
    访问 p
    p = p.right
 }
 翻转
 */
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var cur = root
    var stack = [TreeNode?]()
    var res = [Int]()
    while cur != nil || stack.count > 0 {
        while cur != nil {
            res.append(cur!.val)
            stack.append(cur?.left)
            cur = cur?.right
        }
        cur = stack.removeLast()
    }
    return res.reversed()
}
