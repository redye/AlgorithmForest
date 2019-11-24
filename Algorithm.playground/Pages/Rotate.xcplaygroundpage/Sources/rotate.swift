import Foundation

// 空间复杂度 O(n)
public func rotate(_ nums: inout [Int], _ k: Int) {
    var j = k
    if k >= nums.count {
        j = k % nums.count
    }
    if (j > 0) {
        let sub = nums[(nums.count - j)...(nums.count - 1)]
        let sub2 = nums[0...nums.count - 1 - j]
        nums = Array(sub) + Array(sub2)
    }
}

public func rotate2(_ nums: inout [Int], _ k: Int) {
    var j = k
    if k >= nums.count {
        j = k % nums.count
    }
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

public func rotate3(_ nums: inout [Int], _ k: Int) {
    let j = k % nums.count
    reverse(0, nums.count - 1, &nums)
    reverse(0, j - 1, &nums)
    reverse(j, nums.count - 1, &nums)
}


