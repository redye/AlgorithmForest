import Foundation

/// 题目链接：https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/

/// 递归法
public func postorder(_ root: TreeNode?) -> [Int] {
    guard let cur = root else {
        return []
    }
    let curVal = [cur.val]
    guard let children = cur.chileren else {
        return curVal
    }
    var result = [Int]()
    for x in children {
        let child =  postorder(x)
        result += child
    }
    result += curVal
    return result
}
