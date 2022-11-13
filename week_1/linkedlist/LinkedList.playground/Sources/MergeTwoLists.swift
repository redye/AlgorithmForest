import Foundation

/**
 * 21: https://leetcode-cn.com/problems/merge-two-sorted-lists/
 * 合并两个有序链表
 * 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 */

/**
 * 迭代法
 * 时间复杂度 O(max(n, m))
 * 空间复杂度 O(1)
 */
func mergeTwoLists(_ ln1: ListNode?, _ ln2: ListNode?) -> ListNode? {
    let previous: ListNode? = ListNode(0)
    var current = previous
    var l1 = ln1
    var l2 = ln2
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            current?.next = l1
            l1 = l1?.next
        } else {
            current?.next = l2
            l2 = l2?.next
        }
        current = current?.next
    }
    if l1 != nil {
        current?.next = l1
    }
    if l2 != nil {
        current?.next = l2
    }
    
    return previous?.next
}


/**
 * 递归法
 * 时间复杂度 O(n+m)
 * 空间复杂度 O(n+m)
 */

func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    } else if l2 == nil {
        return l1
    } else if l1!.val < l2!.val {
        l1?.next = mergeTwoLists2(l1?.next, l2)
        return l1
    } else {
        l2?.next = mergeTwoLists2(l1, l2?.next)
        return l2
    }
}
