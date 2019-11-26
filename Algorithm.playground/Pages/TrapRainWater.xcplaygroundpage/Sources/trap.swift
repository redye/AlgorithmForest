import Foundation

/// 题目链接: https://leetcode-cn.com/problems/trapping-rain-water/

/// 时间复杂度 O(n)
/// 空间复杂度 O(n)
public func trap(_ nums: [Int]) -> Int {
    var maxIndex = 0
    var current = 0
    for i in 0..<nums.count {
        if nums[i] > current {
            current = nums[i]
            maxIndex = i
        }
    }
    var cap = [Int](repeating: 0, count: nums.count)
    var limit = 0
    for i in 0..<maxIndex {
        if nums[i] > limit {
            cap[i] = 0
            limit = nums[i]
        } else {
            cap[i] = limit - nums[i]
        }
    }
    var j = nums.count - 1
    limit = 0
    while j > maxIndex {
        if nums[j] > limit {
            cap[j] = 0
            limit = nums[j]
        } else {
            cap[j] = limit - nums[j]
        }
        j -= 1
    }
    var area = 0
    for x in cap {
        area += x
    }
    
    return area
}
