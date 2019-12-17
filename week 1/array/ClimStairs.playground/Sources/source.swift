import Foundation

/**
 * 70. https://leetcode-cn.com/problems/climbing-stairs/
 * 爬楼梯
 * 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 * 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 * 注意：给定 n 是一个正整数。
 */


/**
 * 思路：找最近子问题（最近重复的子问题）
 * 爬第一级台阶时，只有爬1个台阶 一种方法   f(1) = 1
 * 爬第二季台阶时，爬1级台阶两次 | 爬2级台阶1次 两种方法 f(2) = 2
 * 爬第三级台阶时，爬1级台阶3次 | 爬2级台阶1次+爬1级台阶1次  三种方法 f(3) = f(1) + f(2)
 * 爬第四季台阶时，爬3级台阶+爬1级台阶1次 | 爬2级台阶+爬2级台阶1次 f(4) = f(3) + f(2)
 * 斐波那契数列
 * 时间复杂度 O(n)
 * 空间负责度 O(1)
 */
public func climbStairs(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    var f1 = 1
    var f2 = 2
    var f3 = f1 + f2
    for _ in 3...n {
        f3 = f1 + f2
        f1 = f2
        f2 = f3
    }
    return f3
}

/**
 * 动态规划
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
public func climbStairs2(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    var dp = [Int](repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/**
 * 递归
 */
public func climbStairs3(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    return climbStairs(n - 1) + climbStairs(n-2)
}
