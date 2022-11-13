import Foundation

/**
 * 242. https://leetcode-cn.com/problems/valid-anagram/description/
 * 有效的字母异位词
 * 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
 */

/**
 * 计数器
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
public func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    var map = [Character: Int]()
    let cs: [Character] = s.suffix(s.count)
    let ct: [Character] = t.suffix(t.count)
    for i in 0..<cs.count {
        let c = cs[i]
        let c2 = ct[i]
        
        var v1 = map[c] ?? 0
        v1 += 1
        map[c] = v1
        
        var v2 = map[c2] ?? 0
        v2 -= 1
        map[c2] = v2
    }
    
    for value in map.values {
        if value != 0 {
            return false
        }
    }
    
    return true
}
