import Foundation

/// 题目链接: https://leetcode-cn.com/problems/3sum/

/// 暴力解法
/// 时间复杂度 O(n^3)
/// 空间复杂度 O(1)
public func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    var result = [[Int]]()
    for i in 0..<nums.count - 2 {
        for j in (i+1)..<nums.count - 1 {
            for k in (j+1)..<nums.count {
                if nums[i] + nums[j] + nums[k] == 0 {
                    result.append([i, j, k])
                }
            }
        }
    }
    return result
}
