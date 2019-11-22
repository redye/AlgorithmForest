import Foundation

public func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 1 {
        return nums.count
    }
    
    var i = 1
    while i < nums.count {
        if nums[i] == nums[i - 1] {
            nums.remove(at: i)
        } else {
            i += 1
        }
    }
    return nums.count
}


public func removeDuplicates2(_ nums: inout [Int]) -> Int {
    if nums.count <= 0 {
        return 0
    }
    var i = 0
    var j = i + 1
    while j < nums.count {
        if (nums[j] != nums[i]) {
            nums[i + 1] = nums[j]
            i += 1
        }
        j += 1
    }
    return i + 1
}

public func removeDuplicates3(_ nums: inout [Int]) -> Int {
    if nums.count <= 1 {
        return nums.count
    }
    var j = nums.count - 1
    while j > 0 {
        if nums[j] == nums[j - 1] {
            nums.remove(at: j)
        }
        j -= 1
    }
    
    return nums.count
}
