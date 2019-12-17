import Foundation

public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let head = ListNode(0)
    var carry = 0
    var node1 = l1
    var node2 = l2
    var current: ListNode? = head
    while node1 != nil || node2 != nil {
        let val = (node1?.val ?? 0) + (node2?.val ?? 0) + carry
        carry = val / 10
        let next = ListNode(val % 10)
        current?.next = next
        current = current?.next
        node1 = node1?.next
        node2 = node2?.next
    }
    if carry > 0 {
        current?.next = ListNode(carry)
    }

    return head.next
}

public func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let head = l1 != nil ? l1 : (l2 != nil ? l2 : nil)
    var cur = head
    var carry = 0
    var p = l1
    var q = l2
    var previous = head
    while p != nil || q != nil {
        let val = (p?.val ?? 0) + (q?.val ?? 0) + carry
        carry = val / 10
        if cur != nil {
            cur?.val = val % 10
        } else {
            cur = ListNode(val % 10)
            previous?.next = cur
        }
        previous = cur
        cur = cur?.next
        p = p?.next
        q = q?.next
    }
    if carry > 0 {
        previous?.next = ListNode(carry)
    }
    
    return head
}
