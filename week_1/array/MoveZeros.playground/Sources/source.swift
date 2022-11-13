import Foundation

/**
 * 283. https://leetcode-cn.com/problems/move-zeroes
 * 移动零
 * 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 */

/**
 * 双指针法
 * k 指向下一个不为0的位置
 * 遍历数组，nums[i]不为0时，nums[k] = nums[i]
 * k 及 k 之后的位置置位0
 * 时间复杂度 O(n)
 */
public func moveZeroes(_ nums: inout [Int]) {
    var k = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums[k] = nums[i]
            k += 1
        }
    }
    for i in k..<nums.count {
        nums[i] = 0
    }
}


/**
 * 优化
 * k 指向下一个不为0的位置
 * 遍历数组，nums[i]不为0时，nums[i] 与 nums[k] 交换
 */
public func moveZeroes2(_ nums: inout [Int]) {
    var k = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            let tmp = nums[i]
            nums[i] = 0
            nums[k] = tmp
            k += 1
        }
    }
}
