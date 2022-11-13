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


/**
 * 递归解法
 * 1->2->3->4->5
 * head 为 5 时返回
 * head 为 4 时，head.next 为 5 head.next.next = head 即 4->5->4 , 然后 head.next = nil 即 5->4
 * 时间复杂度 O(n)
 * 空间复杂度 O(n) 递归会使用隐式栈空间
 */
public func reverseList2(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let p = reverseList2(head?.next)
    head?.next?.next = head
    head?.next = nil
    return p
}
