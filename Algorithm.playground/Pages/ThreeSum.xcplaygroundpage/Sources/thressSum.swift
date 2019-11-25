import Foundation

/// 题目链接: https://leetcode-cn.com/problems/3sum/

/// 暴力解法
/// 时间复杂度 O(n^3)
/// 空间复杂度 O(1)
public func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    var sortNums = nums.sorted()
    var result = [[Int]]()
    for i in 0..<sortNums.count - 2 {
        /// 去重
        if i > 0 && sortNums[i] == sortNums[i - 1] {
            break
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


/// 双指针法
/// 时间u复杂度 O(n^2)
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
        /// 去重
        if i > 0 && sortNums[i] == sortNums[i - 1] {
            continue
        }
        var j = i + 1
        var k = sortNums.count - 1
        while j < k {
            /// 最大元素都小于 0，不可能有和为 0 的情况
            if sortNums[k] < 0 {
                k -= 1
                continue
            }
            let sum = sortNums[i] + sortNums[j] + sortNums[k]
            if sum == 0 {
                result.append([sortNums[i], sortNums[j], sortNums[k]])
                /// 去重
                while j < k && sortNums[j] == sortNums[j + 1] {
                    j += 1
                }
                /// 去重
                while j < k && sortNums[k] == sortNums[k - 1] {
                    k -= 1
                }
                j += 1
                k -= 1
            } else if sum < 0 {
                while j < k && sortNums[j] == sortNums[j + 1] {
                    j += 1
                }
                j += 1
            } else {
                while j < k && sortNums[k] == sortNums[k - 1] {
                    k -= 1
                }
                k -= 1
            }
        }
    }
    return result
}


/// 哈希表法
/// 时间复杂度 O(n^2)
/// 空间复杂度 O(n)
public func threeSum3(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    let sortNums = nums.sorted()
    var result = [[Int]]()
    var hashMap = [Int: Int]()
    for i in 0..<sortNums.count {
        hashMap[sortNums[i]] = i
    }
    for i in 0..<sortNums.count - 2 {
        if sortNums[i] > 0 {
            break
        }
        if i > 0 && sortNums[i] == sortNums[i-1] {
            continue
        }
        for j in (i+1)..<sortNums.count - 1 {
            if j > i + 1 && sortNums[j] == sortNums[j - 1] {
                continue
            }
            let remainder = 0 - sortNums[i] - sortNums[j]
            if let index = hashMap[remainder], index > j {
                result.append([sortNums[i], sortNums[j], sortNums[index]])
            }
        }
    }
    
    return result
}
