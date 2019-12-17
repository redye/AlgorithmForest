import Foundation

/**
 * 206. https://leetcode.com/problems/reverse-linked-list/
 * 反转链表
 * 反转一个单链表。
 */

public func reverseList(_ head: ListNode?) -> ListNode? {
    var cur = head
    var previous: ListNode? = nil
    while cur != nil {
        let next = cur?.next
        cur?.next = previous
        previous = cur
        cur = next
    }
    return previous
}

