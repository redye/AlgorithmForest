import Foundation

/**
 * 1. https://leetcode-cn.com/problems/two-sum/description/
 * 两数之和
 * 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 * 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 */


/**
 * 哈希表法
 * 时间复杂度 O(2n)
 * 空间复杂度 O(n)
 */
public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for i in 0..<nums.count {
        map[nums[i]] = i
    }
    for i in 0..<nums.count {
        let remainder = target - nums[i]
        if let value = map[remainder] {
            return [i, value]
        }
    }
    return []
}


public func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    
    for i in 0..<nums.count {
        let remainder = target - nums[i]
        if let value = map[remainder] {
            return [i, value]
        } else {
            map[nums[i]] = i
        }
    }
    return []
}
