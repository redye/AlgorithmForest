import Foundation

/// 题目链接：https://leetcode-cn.com/problems/two-sum/

/// 暴力法
/// 时间复杂度 O(n^2)
/// 空间复杂度 O(1)
public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count < 2 {
        return []
    }
    for i in 0..<nums.count - 1 {
        for j in (i + 1)..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}

/// hash 表法
/// 时间复杂度 O(n)
/// 空间复杂度 O(1)
public func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count < 2 {
        return []
    }
    var hashMap = [Int: Int]()
    for i in 0..<nums.count {
        hashMap[nums[i]] = i
    }
    for i in 0..<nums.count {
        let key = target - nums[i]
        if let index = hashMap[key], index != i {
            return [i, index]
        }
    }
    return []
}

public func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
    var hashMap = [Int: Int]()
    for i in 0..<nums.count {
        let remainder = target - nums[i]
        if let index = hashMap[remainder] {
            return [i, index]
        }
        hashMap[nums[i]] = i
    }
    return []
}
