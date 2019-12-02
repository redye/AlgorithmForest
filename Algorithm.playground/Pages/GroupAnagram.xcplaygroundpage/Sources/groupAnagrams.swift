import Foundation

/// 题目链接：https://leetcode-cn.com/problems/group-anagrams/

/// 时间复杂度 O(nklogk) n 为数组的长度 k 为字符串的最大长度
/// 空间复杂度 O(nk)
public func groupAnagrams(_ strs: [String]) -> [[String]] {
    var map = [String: [String]]()
    for x in strs {
        let c = String(x.suffix(x.count).sorted())
        if map[c] == nil {
            map[c] = [String]()
        }
        map[c]!.append(x)
    }
    return Array(map.values)
}

/// 时间复杂度 O(nk)
/// 空间复杂度 O(nk)
public func groupAnagrams2(_ strs: [String]) -> [[String]] {
    var counter = [Int](repeating: 0, count: 26)
    let offset = Character("a").asciiValue!
    var map = [String: [String]]()
    for x in strs {
        let cs: [Character] = x.suffix(x.count)
        for i in 0..<cs.count {
            let c = cs[i]
            let index = Int(c.asciiValue! - offset)
            counter[index] += 1
        }
        var key = ""
        for i in 0..<counter.count {
            key += String(counter[i])
            counter[i] = 0
        }
//        print("cs: \(cs) key: \(key)")
        if map[key] == nil {
            map[key] = [String]()
        }
        map[key]!.append(x)
        
    }
    return Array(map.values)
}
