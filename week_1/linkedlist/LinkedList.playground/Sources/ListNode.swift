import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


public func createLinkedList(_ nums: [Int]) -> ListNode? {
    if nums.count <= 0 {
        return nil
    }
    let head = ListNode(0)
    var cur = head
    for x in nums {
        let next = ListNode(x)
        cur.next = next
        cur = cur.next!
    }
    
    return head.next
}

public func printLinkedList(_ node: ListNode?)  {
    var head = node
    var s = [Int]()
    while head != nil {
        s.append(head!.val)
        head = head?.next
    }
    print(s)
}

