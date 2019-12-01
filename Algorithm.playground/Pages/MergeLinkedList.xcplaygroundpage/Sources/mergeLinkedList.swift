import Foundation

/// 题目链接：https://leetcode-cn.com/problems/merge-two-sorted-lists/

public class ListNode {
    var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public func createLinkedList(_ nums: [Int]) -> ListNode {
    var head = ListNode(0)
    var current = head
    for x in nums {
        let node = ListNode(x)
        current.next = node
        current = current.next!
    }
    if (head.next != nil) {
        head = head.next!
    }
    return head
}

public func printLinkedList(_ node: ListNode?)  {
    var head = node
    while head != nil {
        print(head!.val)
        head = head?.next
    }
}

/// 指针法
/// 时间复杂度 O(n + m)
/// 空间复杂度 O(1)
public func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    var list1 = l1
    var list2 = l2
    let list: ListNode? = ListNode(0)
    var current: ListNode? = list
    while list1 != nil && list2 != nil {
        let val1 = list1!.val
        let val2 = list2!.val
        if val1 < val2 {
            current?.next = list1
            list1 = list1?.next
        } else {
            current?.next = list2
            list2 = list2?.next
        }
        current = current?.next
    }
    current?.next = list1 != nil ? list1 : list2
    
    return list?.next
}

/// 递归法
/// 时间复杂度 O(n + m)
/// 空间复杂度 O(n + m)
public func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    let val1 = l1!.val
    let val2 = l2!.val
    if val1 < val2 {
        l1?.next = mergeTwoLists2(l1?.next, l2)
        return l1
    } else {
        l2?.next = (mergeTwoLists2(l1, l2?.next))
        return l2
    }
}
