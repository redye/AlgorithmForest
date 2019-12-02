import Foundation

/// 题目链接：https://leetcode-cn.com/problems/valid-anagram/description/

/// 字母排序后相同 => 不存在两者都没有的字母
/// hash
/// 时间复杂度 O(n)
/// 空间复杂度 O(n)
public func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    var map = [Character: Int]()
    let cs: [Character] = s.suffix(s.count)
    let ct: [Character] = t.suffix(t.count)
    for i in 0..<s.count {
        let c = cs[i]
        let c2 = ct[i]
        
        var v1 = map[c] ?? 0
        v1 += 1
        map[c] = v1
        
        var v2 = map[c2] ?? 0
        v2 -= 1
        map[c2] = v2
    }
    for v in map.values {
        if v != 0 {
            return false
        }
    }
    return true
}


/// 排序
public func isAnagram2(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    /// 26 个字母
    let cs = s.sorted()
    let ct = t.sorted()
    for i in 0..<cs.count {
        if cs[i] != ct[i] {
            return false
        }
    }
    return true
}

/// 数组
/// 时间复杂度 O(n)
/// 空间复杂度 O(1)
public func isAnagram3(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    var nums = [Int](repeating: 0, count: 26)
    let cs: [Character] = s.suffix(s.count)
    let ct: [Character] = t.suffix(t.count)
    let a = Character("a").asciiValue!
    for i in 0..<s.count {
        let c = cs[i]
        let c2 = ct[i]
        let index1 = Int(c.asciiValue! - a)
        nums[index1] += 1
        let index2 = Int(c2.asciiValue! - a)
        nums[index2] -= 1
    }
    for x in nums {
        if x > 0 {
            return false
        }
    }
    return true
}
