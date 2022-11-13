import Foundation

/**
 * 49. https://leetcode-cn.com/problems/group-anagrams/
 * 字母异位词分组
 * 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var map = [String: [String]]()
    
    var counter = [Int](repeating: 0, count: 26)
    
    let offset = Character("a").asciiValue!
    for s in strs {
        for c in s {
            let index = Int(c.asciiValue! - offset)
            counter[index] += 1
        }
        var key = ""
        for i in 0..<counter.count {
            key += String(counter[i])
            counter[i] = 0
        }
        if map[key] == nil {
            map[key] = [String]()
        }
        map[key]!.append(s)
    }
    
    return Array(map.values)
}
