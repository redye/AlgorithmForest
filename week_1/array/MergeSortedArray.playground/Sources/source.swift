import Foundation

/**
 * 88. https://leetcode-cn.com/problems/merge-sorted-array/
 * 合并两个有序数组
 * 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 */

/**
 * 双指针，从前往后
 * 开辟一个新的空间用来临时存储 nums1 的值
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
public func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = 0
    var j = 0
    let tmp = nums1
    var k = 0
    while i < m && j < n {
        if tmp[i] < nums2[j] {
            nums1[k] = tmp[i]
            i += 1
        } else {
            nums1[k] = nums2[j]
            j += 1
        }
        k += 1
    }
    while i < m {
        nums1[k] = tmp[i]
        i += 1
        k += 1
    }
    while j < n {
        nums1[k] = nums2[j]
        j += 1
        k += 1
    }
}

/**
 * 双指针，从后往前
 * 时间复杂度 O(n)
 * 空间复杂度 O(1)
 */
public func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var k = m + n - 1
    var i = m - 1
    var j = n - 1
    while i >= 0 && j >= 0{
        if nums2[j] >= nums1[i] {
            nums1[k] = nums2[j]
            j -= 1
        } else {
            nums1[k] = nums1[i]
            i -= 1
        }
        k -= 1
    }
    while j >= 0 {
        nums1[k] = nums2[j]
        j -= 1
        k -= 1
    }
}
