import Foundation

/// 题目链接：https://leetcode-cn.com/problems/climbing-stairs/?utm_source=LCUS&utm_medium=ip_redirect_q_uns&utm_campaign=transfer2china

/// 找最近重复子问题
///  n = 1,  fn = 1 -> 1  1 级台阶时，
///  n = 2,  fn = 2 -> 1 1 ||  2  2 级台阶时，
///  n = 3,  fn = 3 -> 1 1 1 || 1 2 || 2 1  第三级台阶时，则 第一季台阶时 + 2， 或者第二级台阶时 + 1
///  n = 4 时，第三级台阶 +1 或者 第二级台阶 + 2
////   f(n) = f(n-1) + f(n-2)  斐波那契数列

/// 时间复杂度 O(n)
public func climbStairs(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    var f1 = 1
    var f2 = 2
    var f3 = 3
    for _ in 3...n {
        f3 = f1 + f2
        f1 = f2
        f2 = f3
    }
    return f3
}


/// 超出时间限制
/// 时间复杂度 O(2^n)
/// 空间复杂度 O(n)
public func fib(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    return fib(n-1) + fib(n-2)
}

/// 时间复杂度 O(n)
/// 空间复杂度 O(n)
public func fib2(_ n: Int) -> Int {
    var r = [1, 2]
    if n > 2 {
        for i in 2..<n {
            r.append(r[i - 1] + r[i - 2])
        }
    }
    return r[n - 1]
}
