import Foundation

/**
 * 11. https://leetcode-cn.com/problems/container-with-most-water/submissions/
 * 盛最多的水
 * 给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 *
 */

/**
 * 暴力破解法
 * 时间复杂度 O(n^2)
 * 空间复杂度 O(1)
 */
public func maxArea(_ nums: [Int]) -> Int {
    if nums.count <= 0 {
        return 0
    }
    var maxArea = 0
    for i in 0..<nums.count - 1 {
        for j  in i..<nums.count {
            let cur = (j - i) * min(nums[i], nums[j])
            maxArea = max(maxArea, cur)
        }
    }
    return maxArea
}

/**
 * 收敛法
 * area = (j - i) * min(height[i], height[j])
 * 短板向内移动 min(height[i], height[j]) 可能变大，盛水宽度变小，盛水面积可能变大
 * 长板向内移动 min(height[i], height[j]) 可能不变或变小，盛水宽度变小，盛水面积不可能变大
 * 所以短板向内移动
 * 时间复杂度 O(n)
 * 空间复杂度 O(1)
 */
public func maxArea2(_ nums: [Int]) -> Int {
    if nums.count <= 0 {
        return 0
    }
    var i = 0
    var j = nums.count - 1
    var area = 0
    while i < j {
        area = max(area, (j - i) * min(nums[i], nums[j]))
        if nums[i] > nums[j] {
            j -= 1
        } else {
            i += 1
        }
    }
    return area
}
