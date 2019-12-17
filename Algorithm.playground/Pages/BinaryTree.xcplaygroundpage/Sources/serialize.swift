import Foundation

// 题目链接：https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/

/// 层序遍历
public func serialize(_ root: TreeNode?) -> String {
    if root == nil {
        return ""
    }
    var queue = [root]
    var s = "["
    while queue.count > 0 {
        let node = queue.removeFirst()
        if node != nil {
            s += String(node!.val)
        } else {
            s += "null"
        }
        s += ","
    }
    return ""
}


public func deserialize(_ data: String) -> TreeNode? {
    if data.count == 0 {
        return nil
    }
    
    return nil
}
