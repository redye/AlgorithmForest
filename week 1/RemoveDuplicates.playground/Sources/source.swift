import Foundation

/**
 * 26. https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/
 * 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
 
 * 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
 */

/**
 * 双指针法
 * 时间复杂度 O(n)
 * 空间复杂度 O(1)
 */
public func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 0 {
        return 0
    }
    var i = 0
    var j = i + 1
    while j < nums.count {
        if nums[j] != nums[i] {
            i += 1
            nums[i] = nums[j]
        }
        j += 1
    }
    return i + 1
}

/*
 * 优化：当数组中元素都不相等时，每次都会原地赋值一次
 *      可以添加一个判断，当两指针的差值大于0时，才进行操作
 */
public func removeDuplicates2(_ nums: inout [Int]) -> Int {
    if nums.count <= 0 {
        return 0
    }
    var i = 0
    var j = i + 1
    while j < nums.count {
        if nums[j] != nums[i] {
            i += 1
            if j - i > 0 {
                nums[i] = nums[j]
            }
        }
        j += 1
    }
    return i + 1
}
