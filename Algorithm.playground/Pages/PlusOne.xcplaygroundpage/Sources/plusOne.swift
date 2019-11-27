import Foundation

/// 题目链接：https://leetcode-cn.com/problems/plus-one/

/// 暴力法
/// 时间复杂度 O(n)
/// 空间复杂度 O(n)
public func plusOne(_ digits: [Int]) -> [Int] {
    var newDigits = digits
    let len = digits.count
    var i = len - 1
    while i >= 0 {
        newDigits[i] = (newDigits[i] + 1) % 10
        if newDigits[i] != 0 {
            return newDigits
        }
        i -= 1
    }
    
    newDigits.insert(1, at: 0)
    return newDigits
}

