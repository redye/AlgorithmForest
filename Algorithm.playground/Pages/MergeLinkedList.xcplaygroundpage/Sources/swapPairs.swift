import Foundation

/// 题目链接： https://leetcode-cn.com/problems/swap-nodes-in-pairs/solution/hua-jie-suan-fa-24-liang-liang-jiao-huan-lian-biao/

/// 添加一个 node 在 head 之前 thead
/// 时间复杂度 O(n)
/// 空间复杂度 O(1)
public func swapPairs(_ head: ListNode?) -> ListNode? {
    
    let thead: ListNode? = ListNode(-1)
    thead!.next = head
    var c = thead
    while c?.next != nil && c?.next?.next != nil {
        let a = c?.next
        let b = c?.next?.next
        c?.next = b
        a?.next = b?.next
        b?.next = a
        c = c?.next?.next
    }
    
    return thead?.next
}

/// 递归法
public func swapPairs2(_ head: inout ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let next = head?.next
    head?.next = swapPairs(head?.next?.next)
    next?.next = head
    
    return next
}
