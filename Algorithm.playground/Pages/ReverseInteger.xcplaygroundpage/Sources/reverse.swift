import Foundation

/// 题目链接：https://leetcode-cn.com/problems/reverse-integer/solution/zheng-shu-fan-zhuan-by-leetcode/

/// 时间复杂度 O(n)
public func reverse2(_ num: Int) -> Int {
    let INT_MAX = 2147483647
    let INT_MIN = -2147483648
    var rev = 0
    var x = num
    while (x != 0) {
        let pop = x % 10;
        x /= 10;
        if rev > INT_MAX/10 || (rev == INT_MAX / 10 && pop > INT_MAX % 10) {
             return 0
        }
        if rev < INT_MIN/10 || (rev == INT_MIN / 10 && pop < INT_MIN % 10) {
            return 0
        }
        rev = rev * 10 + pop;
    }
    return rev
}
