import Foundation

/**
 * 189. https://leetcode-cn.com/problems/rotate-array/
 * 旋转数组
 * 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 
 * 输入: [1,2,3,4,5,6,7] 和 k = 3
 * 输出: [5,6,7,1,2,3,4]
 * 解释:
 * 向右旋转 1 步: [7,1,2,3,4,5,6]
 * 向右旋转 2 步: [6,7,1,2,3,4,5]
 * 向右旋转 3 步: [5,6,7,1,2,3,4]
 */

/**
 * 三次翻转
 * [1,2,3,4,5,6,7]
 * [7,6,5,4,3,2,1]
 * [5,6,7,4,3,2,1]
 * [5,6,7,1,2,3,4]
 * 时间复杂度 O(n)
 */
public func rotate(_ nums: inout [Int], _ k: Int) {
    func reverse(_ nums: inout [Int],_ start: Int, _ end: Int) {
        var low = start
        var high = end
        while low < high {
            let tmp = nums[high]
            nums[high] = nums[low]
            nums[low] = tmp
            low += 1
            high -= 1
        }
    }
    reverse(&nums, 0, nums.count - 1)
    reverse(&nums, 0, k - 1)
    reverse(&nums, k, nums.count - 1)
}
