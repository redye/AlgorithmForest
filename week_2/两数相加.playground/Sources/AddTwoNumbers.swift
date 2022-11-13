import Foundation

/**
 * 2. https://leetcode-cn.com/problems/add-two-numbers/
 * 两数相加
 * 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 * 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 * 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 *
 * 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 * 输出：7 -> 0 -> 8
 * 原因：342 + 465 = 807
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    let previous = ListNode(-1)
    var carry = 0
    var list1 = l1
    var list2 = l2
    var cur: ListNode? = previous
    while list1 != nil || list2 != nil {
        let val = ((list1?.val ?? 0) + (list2?.val ?? 0) + carry) % 10
        carry = ((list1?.val ?? 0) + (list2?.val ?? 0) + carry) / 10
        let node = ListNode(val)
        cur?.next = node
        cur = cur?.next
        list1 = list1?.next
        list2 = list2?.next
    }
    if carry > 0 {
        cur?.next = ListNode(carry)
    }
    
    return previous.next
}
