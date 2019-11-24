import Foundation

/// leetcode 链接：https://leetcode-cn.com/problems/container-with-most-water/submissions/

/// 暴力破解法
/// 时间复杂度 O(n^2)
/// 超出时间限制
public func maxArea(_ height: [Int]) -> Int {
    var result = 0
    for i in 0..<height.count - 1 {
        for j in i..<height.count {
            let area = (j - i) * min(height[i], height[j])
            result = max(result, area)
        }
    }
    return result
}

/// 收敛法
/// 时间复杂度 O(n)
public func maxArea2(_ height: [Int]) -> Int {
    var result = 0
    var i = 0
    var j = height.count - 1
    while i < j {
        let area = (j - i) * min(height[i], height[j])
        result = max(result, area)
        height[i] < height[j] ? (i += 1) : (j -= 1)
    }
    
    return result
}
