import Foundation

/**
 * 20. https://leetcode-cn.com/problems/valid-parentheses/
 * 有效的括号
 * 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 * 有效字符串需满足：
 * 左括号必须用相同类型的右括号闭合。
 * 左括号必须以正确的顺序闭合。
 * 注意空字符串可被认为是有效字符串。
 */

/**
 * 栈
 *
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
public func isValid(_ s: String) -> Bool {
    if s.count == 0 {
        return true
    }
    if s.count % 2 != 0 {
        return false
    }
    let matchMap = [")": "(", "}": "{", "]": "["]
    var stack = [String]()
    
    for i in 0..<s.count {
        let startIndex = s.index(s.startIndex, offsetBy: i)
        let endIndex = s.index(s.startIndex, offsetBy: i + 1)
        let c = String(s[startIndex..<endIndex])
        if stack.count > 0 {
            let match = matchMap[c]
            let last = stack[stack.count - 1]
            if last == match {
                stack.removeLast()
            }
        } else {
            stack.append(c)
        }
    }
    
    return stack.count == 0
}
