import Foundation
/**
 * 24. https://leetcode-cn.com/problems/swap-nodes-in-pairs/
 * 两两交换链表中的节点
 * 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 * 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 */

/**
 * 迭代法
 * 1 -> 2 -> 3 -> 4  => 2 -> 1 -> 4 -> 3
 * 创建一个前节点：previous -1 -> 1 -> 2 -> 3 -> 4
 * 操作新的链表
 */
func swapPairs(_ head: ListNode?) -> ListNode? {
    let previous:ListNode? = ListNode(-1)
    previous?.next = head
    var cur = previous
    while cur != nil && cur?.next != nil && cur?.next?.next != nil {
        let start = cur?.next
        let end = cur?.next?.next
        cur?.next = end
        start?.next = end?.next
        end?.next = start
        cur = start
    }

    return previous?.next
}

/**
 * 递归
 */
func swapPairs2(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil{
        return head
    }
    
    let next = head?.next
    head?.next = swapPairs(next?.next)
    next?.next = head
    return next
}
