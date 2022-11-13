import Foundation

/**
 * 143. https://leetcode-cn.com/problems/reorder-list/
 * 重排链表
 * 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
 * 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…
 * 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 *
 * 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
 * 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
 * 1：首先重新排列后，链表的中心节点会变为最后一个节点。所以需要先找到链表的中心节点
 * 2：可以按照中心节点将原始链表划分为左右两个链表。
 * 2.1：按照中心节点将原始链表划分为左右两个链表，左链表：1->2->3 右链表：4->5
 * 2.2：将右链表反转，就正好是重排链表交换的顺序，右链表反转：5->4
 * 3：合并两个链表，将右链表插入到左链表，即可重新排列成：1->5->2->4->3.
 */
func reorderList(_ head: ListNode?) {
    if head == nil {
        return
    }
    
    let middle = middleNode(head)
    
    var right = reverse(middle?.next)
    middle?.next = nil
    
    var cur = head
    while cur?.next != nil && right != nil {
        let next = cur?.next
        let rnext = right?.next
        cur?.next = right
        right?.next = next
        right = rnext
        cur = next
    }
}


func middleNode(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    var fast = head
    var slow = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    return slow
}


func reverse(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    var previous: ListNode? = nil
    var cur = head
    while cur != nil {
        let tmp = cur?.next
        cur?.next = previous
        previous = cur
        cur = tmp
    }
    
    return previous
}
