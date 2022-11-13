import Foundation

/**
 * 876. https://leetcode-cn.com/problems/middle-of-the-linked-list/
 * 链表的中间结点
 * 给定一个带有头结点 head 的非空单链表，返回链表的中间结点。
 * 如果有两个中间结点，则返回第二个中间结点。
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
 * 哈希表法
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */

public func middleNode(_ head: ListNode?) -> ListNode? {
    var map = [Int: ListNode]()
    
    var count = 0
    
    var cur = head
    
    while cur != nil {
        map[count] = cur!
        count += 1
        cur = cur?.next
    }
    let mid = (count / 2) + 1
    
    return map[mid - 1]
}

/**
 * 快慢指针
 * 时间复杂度 O(n)
 * 空间复杂度 O(1)
 */

public func middleNode2(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    return slow
}
