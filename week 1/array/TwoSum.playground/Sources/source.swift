import Foundation

/**
 * 1. https://leetcode-cn.com/problems/two-sum/
 * 两数之和
 * 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个整数，并返回他们的数组下标。
 *
 * 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 *
 */

/**
 * 暴力解法
 * 时间复杂度 O(n^2)
 * 空间复杂度 O(1)
 */
public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count < 2 {
        return []
    }
    for i in 0..<nums.count - 1 {
        for j in i..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}

/**
 * 哈希表法
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
public func twoSums2(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for i in 0..<nums.count {
        map[nums[i]] = i
    }
    for i in 0..<nums.count {
        let key = target - nums[i]
        if let index = map[key] {
            return [i, index]
        }
    }
    return []
}

/**
 * 哈希表优化
*/
public func twoSums3(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for i in 0..<nums.count {
        let key = target - nums[i]
        if let index = map[key] {
            return [i, index]
        } else {
            map[nums[i]] = i
        }
    }
    return []
}
