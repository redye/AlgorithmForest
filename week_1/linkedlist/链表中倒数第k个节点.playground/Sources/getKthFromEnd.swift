import Foundation

/**
 * 22. https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
 * 链表中倒数第k个节点
 * 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。
 * 例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。
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
 * 哈希表
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */
func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil {
        return nil
    }
    var map = [Int: ListNode]()
    
    var cur = head
    var i = 1
    while cur != nil {
        map[i] = cur
        cur = cur?.next
        i += 1
    }
    if i - 1 < k {
        return nil
    }
    let key = i - k
    return map[key]
}


/**
 * 双指针
 * fast 指针先走 k 步，然后 slow 指针在开始走，当 fast 指针都到链表结束时，slow 指针的位置就是倒数第 k 个节点
 * 时间复杂度 O(n)
 * 空间复杂度 O(1)
 */
func getKthFromEnd2(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil {
        return nil
    }
    var fast = head
    var slow = head
    var count = 0
    while fast != nil {
        fast = fast?.next
        if count >= k {
            slow = slow?.next
        }
        count += 1
    }
    return slow
}
