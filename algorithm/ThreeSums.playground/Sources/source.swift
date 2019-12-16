import Foundation

/**
 * 15. https://leetcode-cn.com/problems/3sum/
 * 三数之和
 * 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 *
 */

/**
 * 暴力解法：三层否循环
 * 首先对数组排序，排序的时间复杂度最低为 O(logn)
 * 注意去重：数组排序后，相同的元素肯定是连续的
 * 时间复杂度 O(n^3)
 * 空间复杂度 O(1)
 */
public func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    let sortNums = nums.sorted()
    var result = [[Int]]()
    for i in 0..<sortNums.count - 2 {
        if sortNums[i] > 0 {
            break
        }
        if i > 0 && sortNums[i] == sortNums[i - 1] {
            continue
        }
        for j in (i+1)..<sortNums.count - 1 {
            for k in (j+1)..<sortNums.count {
                if sortNums[i] + sortNums[j] + sortNums[k] == 0 {
                    result.append([sortNums[i], sortNums[j], sortNums[k]])
                }
            }
        }
    }
    return result
}


/**
 * 双指针法
 * 排序
 * 去重
 * 时间复杂度 O(n^2)
 * 空间复杂度 O(1)
 */
public func threeSum2(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    let sortNums = nums.sorted()
    var result = [[Int]]()
    for i in 0..<sortNums.count - 2 {
        if sortNums[i] > 0 {
            break
        }
        if i > 0 && sortNums[i] == sortNums[i - 1] {
            continue
        }
        var left = i + 1
        var right = sortNums.count - 1
        while left < right {
            let tmp = sortNums[i] + sortNums[left] + sortNums[right]
            if tmp == 0 {
                result.append([sortNums[i], sortNums[left], sortNums[right]])
            } else if tmp < 0 {
                // 结果小于0，左指针向右移动
                left += 1
            } else {
                // 结果大于0，右指针向左移动
                right -= 1
            }
        }
    }
    return result
}
