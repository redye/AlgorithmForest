import Foundation

/// 题目链接：https://leetcode-cn.com/problems/rotate-array/

/// 空间复杂度 O(n)
/// 时间复杂度 O(n)
/// 辅助数组
public func rotate(_ nums: inout [Int], _ k: Int) {
    if k <= 0 {
        return
    }
    var tmp = [Int](repeating: 0, count: nums.count)
    for i in 0..<nums.count {
        let index = (i + k) % nums.count
        tmp[index] = nums[i]
    }
    for i in 0..<nums.count {
        nums[i] = tmp[i]
    }
}

public func rotate4(_ nums: inout [Int], _ k: Int) {
    let j = k % nums.count
    if (j > 0) {
        let sub = nums[(nums.count - j)...(nums.count - 1)]
        let sub2 = nums[0...nums.count - 1 - j]
        nums = Array(sub) + Array(sub2)
    }
}

/// 空间复杂度 O(1)
/// 时间复杂度 O(n * k)
public func rotate2(_ nums: inout [Int], _ k: Int) {
    let j = k % nums.count
    for _ in 0..<j {
        let x = nums.remove(at: nums.count - 1)
        nums.insert(x, at: 0)
    }
}

func reverse(_ start: Int, _ end: Int, _ nums: inout [Int]) {
    var x = start
    var y = end
    while x < y {
        let tmp = nums[x]
        nums[x] = nums[y]
        nums[y] = tmp
        x += 1
        y -= 1
    }
}

/// 空间复杂度 O(1)
/// 时间复杂度 O(n)
public func rotate3(_ nums: inout [Int], _ k: Int) {
    let j = k % nums.count
    reverse(0, nums.count - 1, &nums)
    reverse(0, j - 1, &nums)
    reverse(j, nums.count - 1, &nums)
}

/// 环状替换
public func rotate5(_ nums: inout [Int], _ k: Int) {
    let j = k % nums.count
    if j == 0 {
        return
    }
    var count = 0
    var start = 0
    while count < nums.count {
        var previous = nums[start]
        var next = (start + j) % nums.count
        var current = next
        while start != current {
            let tmp = nums[next]
            nums[next] = previous
            previous = tmp
            current = next
            next = (current + j) % nums.count
            count += 1
        }
        start += 1
    }
}
