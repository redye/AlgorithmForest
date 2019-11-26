import Foundation

/// 题目链接: https://leetcode-cn.com/problems/trapping-rain-water/

/// 找出所有高度中的最高值，
/// 那么最高值左边的列只需要关注之前一列的高度，之前一列的高度比当前高度高，则能接水，接水的高度是两者高度差
/// 最高值右边的列只需关注之后的一列，之后的一列比当前高度高，则能接水，接水的高度是两者高度差
/// 时间复杂度 O(n)
/// 空间复杂度 O(n)
public func trap(_ nums: [Int]) -> Int {
    var maxIndex = 0
    var current = 0
    for i in 0..<nums.count {
        if nums[i] > current {
            current = nums[i]
            maxIndex = i
        }
    }
    var cap = [Int](repeating: 0, count: nums.count)
    var limit = 0
    for i in 0..<maxIndex {
        if nums[i] > limit {
            cap[i] = 0
            limit = nums[i]
        } else {
            cap[i] = limit - nums[i]
        }
    }
    var j = nums.count - 1
    limit = 0
    while j > maxIndex {
        if nums[j] > limit {
            cap[j] = 0
            limit = nums[j]
        } else {
            cap[j] = limit - nums[j]
        }
        j -= 1
    }
    var area = 0
    for x in cap {
        area += x
    }
    
    return area
}

/// 暴力求解
/// 时间复杂度 O(n^2)
/// 空间复杂度 O(1)
public func trap2(_ height: [Int]) -> Int {
    if height.count < 3 {
        return 0
    }
    
    var area = 0;
    var maxLeft = 0
    var maxRight = 0
    /// 按列求
    /// 当前列能接到的雨水： 左边最高墙 ~ 右边最高墙 的较小值决定
    for i in 1..<height.count-1 {
        maxLeft = height[i]
        maxRight = height[i]
        var j = i - 1
        while j >= 0 {
            if height[j] > maxLeft {
                maxLeft = height[j]
            }
            j -= 1
        }
        j = i + 1
        while j < height.count {
            if height[j] > maxRight {
                maxRight = height[j]
            }
            j += 1
        }
        let currentColumn = min(maxLeft, maxRight) - height[i]
        area += currentColumn
    }
    
    return area
}

/// 动态规划: 缓存每列左边最高列，右边最高列
/// 时间复杂度: O(n)
/// 空间复杂度: O(n)
public func trap3(_ height: [Int]) -> Int {
    if height.count < 3 {
        return 0
    }
    var maxLefts = [Int](repeating: height[0], count: height.count)
    var maxRights = [Int](repeating: height[height.count - 1], count: height.count)

    for i in 1..<height.count - 1 {
        maxLefts[i] = max(maxLefts[i - 1], height[i])
    }
    var i = height.count - 2
    while i > 0 {
        maxRights[i] = max(maxRights[i + 1], height[i])
        i -= 1
    }
    
    var area = 0
    for i in 1..<height.count - 1 {
        let tmp = min(maxLefts[i], maxRights[i]) - height[i]
        area += tmp
    }
    
    return area
}

/// 双指针法
/// maxLeft = max(height[left], maxLeft)
/// maxRight = max(height[right], maxRight)
/// height[left] < height[right] ==> maxLeft < maxRight
/// maxLeft < maxRight  ==> 当前列的一定能接雨水，雨水的高度由 maxLeft 决定
/// 反之亦然
/// 时间复杂度 O(n)
/// 空间复杂度 O(1)
public func trap4(_ height: [Int]) -> Int {
    if height.count < 3 {
        return 0
    }
    
    var maxLeft = 0
    var maxRight = 0
    
    var left = 0
    var right = height.count - 1
    var area = 0
    for _ in 0..<height.count {
        if height[left] < height[right] {
            maxLeft = max(maxLeft, height[left])
            let tmp = maxLeft - height[left]
            area += tmp
            left += 1
        } else {
            maxRight = max(maxRight, height[right])
            let tmp = maxRight - height[right]
            area += tmp
            right -= 1
        }
//        print("left: \(left-1); maxLeft: \(maxLeft); right:\(right+1); maxRight: \(maxRight); area: \(area)")
    }
    
    return area
}

/// 入栈法 指针入栈
public func trap5(_ height: [Int]) -> Int {
    var stack = [Int]()
    var current = 0
    var area = 0
    while current < height.count {
        while stack.count > 0 && height[current] > height[stack[stack.count - 1]] {
            let pop  = stack.removeLast()
            if stack.count <= 0 {
                break
            }
            let top = stack[stack.count - 1]
            let distance = current - top - 1
            let minHeight = min(height[top], height[current])
            area = area + (minHeight - height[pop]) * distance
        }
        stack.append(current)
        current += 1
    }
    
    
    return area
}
