import Foundation

/**
 * 66. https://leetcode-cn.com/problems/plus-one/
 * 加一
 * 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 
 * 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
 
 * 你可以假设除了整数 0 之外，这个整数不会以零开头。

 */

/**
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
public func plusOne(_ digits: [Int]) -> [Int] {
    var newDigits = digits
    var i = digits.count - 1
    while i >= 0 {
        newDigits[i] = (newDigits[i] + 1) % 10
        if newDigits[i] != 0 {
            return newDigits
        }
        i -= 1
    }
    newDigits = [Int](repeating: 0, count: digits.count + 1)
    newDigits[0] = 1
    return newDigits
}
