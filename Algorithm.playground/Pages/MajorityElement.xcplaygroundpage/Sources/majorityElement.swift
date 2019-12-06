import Foundation

/// 题目链接： https://leetcode-cn.com/problems/majority-element/description/

/**
 * 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
 * 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
 */
/// 哈希表
/// 时间复杂度 O(n)
/// 空间复杂度 O(n)
public func majorityElement(_ nums: [Int]) -> Int {
    let majorityCount = nums.count / 2
    var map = [Int: Int]()
    for x in nums {
        if let count = map[x] {
            map[x] = count + 1
            
        } else {
            map[x] = 1
        }
        let currentCount = map[x] ?? 0
        if currentCount > majorityCount {
            return x
        }
    }
    return -1
}

/// 暴力法
/// 时间复杂度 O(n^2)
public func majorityElement2(_ nums: [Int]) -> Int {
    let majorityCount = nums.count / 2
    
    var currentCount = 0
    for x in nums {
        for y in nums {
            if y == x {
                currentCount += 1
            }
            if currentCount > majorityCount {
                return y
            }
        }
    }
    return -1
}

/// 排序法
/// 时间复杂度 O(nlogn)
public func majorityElement3(_ nums: [Int]) -> Int {
    let sortNums = nums.sorted()
    return sortNums[sortNums.count / 2]
}


/// 投票法
/// 个数 > n/2 的值，即个数占数组y一半以上
/// 时间复杂度 O(n)
public func majorityElement4(_ nums: [Int]) -> Int {
    var candiate: Int = 0
    
    var count = 0
    for x in nums {
        if count == 0 {
            candiate = x
        }
        count += (x == candiate ? 1: -1)
    }
    return candiate
}

/// 递归分治法
public func majorityElement5(_ nums: [Int]) -> Int {
    func countInRange(_ target: Int, _ low: Int, _ high: Int) -> Int {
        var count = 0
        for i in low...high {
            if target == nums[i] {
                count += 1
            }
        }
        return count
    }
    
    func majorityElementInRange(_ low: Int, _ high: Int) -> Int {
        if low == high {
            return nums[low]
        }
        let mid = (low + high) / 2
        let left = majorityElementInRange(low, mid)
        let right = majorityElementInRange(mid+1, high)
        if left == right {
            return left
        }
        let leftCount = countInRange(left, low, high)
        let rightCount = countInRange(right, low, high)
        return leftCount > rightCount ? left : right
    }
    
    let result = majorityElementInRange(0, nums.count-1)
    return result
}
