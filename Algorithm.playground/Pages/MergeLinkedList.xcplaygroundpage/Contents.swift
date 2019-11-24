//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let a1 = [1, 2, 4]
var l1 = ListNode(0)
for x in a1 {
    l1.next = ListNode(x)
    l1 = l1.next!
}
l1 = l1.next!
print(l1)

let a2 = [1, 3, 4]
var l2 = ListNode(0)
for x in a2 {
    l2.next = ListNode(x)
    l2 = l2.next!
}
l2 = l2.next!
print(l2)

mergeTwoLists(l1, l2)
