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
 * => [7,6,5,4,3,2,1]
 * => [5,6,7,4,3,2,1]
 * => [5,6,7,1,2,3,4]
 * 时间复杂度 O(n)
 */
public func rotate(_ nums: inout [Int], _ k: Int) {
    let j = k % nums.count
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
    reverse(&nums, 0, j - 1)
    reverse(&nums, j, nums.count - 1)
}

/**
 * 暴力解法
 * 循环移动
 * 时间复杂度 O(k*n)
 */
public func rotate2(_ nums: inout [Int], _ k: Int) {
    let count = k % nums.count
    for _ in 0..<count {
        let tmp = nums[nums.count - 1]
        var j = nums.count - 1
        while j > 0 {
            nums[j] = nums[j - 1]
            j -= 1
        }
        nums[0] = tmp
    }
}


/**
 * 环状替换
 * [1,2,3,4,5,6,7] 和 k = 3
 * => [5, 6, 7, 1, 2, 3, 4]
 * 第0号位换到第3号位
 * 第1号位换到第4号位
 * 第2号位换到第5号位
 * ....
 * 第 i 号位换到底 len - k - 1 号位
 *
 * 第 len - k 号位换到第 0 位
 * 第 len - k + 1 号位换到第 1 位
 */
public func rotate3(_ nums: inout [Int], _ k: Int) {
    
}

/**
 * 使用额外的数组，将元素放在正确的位置上
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
public func rotate4(_ nums: inout [Int], _ k: Int) {
    var tmp = [Int](repeating: 0, count: nums.count)
    for i in 0..<nums.count {
        let index = (i + k) % nums.count
        tmp[index] = nums[i]
    }
    for i in 0..<nums.count {
        nums[i] = tmp[i]
    }
}
