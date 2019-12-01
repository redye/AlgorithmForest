import Foundation

/// 题目链接：https://leetcode-cn.com/problems/reverse-linked-list/solution/fan-zhuan-lian-biao-by-leetcode/

/// 时间复杂度: O(n)
public func reverseList(_ head: ListNode?) -> ListNode? {
    var current = head
    var previous: ListNode? = nil
    while current != nil {
        let next = current?.next
        current?.next = previous
        previous = current
        current = next
    }
    return previous
}
