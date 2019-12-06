//: [Previous](@previous)

import Foundation

let l1 = createLinkedList([1, 2, 4])
let l2 = createLinkedList([2, 5, 6])
mergeTwoLists(l1, l2)

let l3 = createLinkedList([2, 3, 5])
let reverseL1 = reverseList(l3)
printLinkedList(reverseL1)


let l4 = createLinkedList([1, 2, 3, 4])
printLinkedList(swapPairs(l4))

var l5: ListNode? = createLinkedList([1, 2, 3, 4])
printLinkedList(swapPairs2(&l5))
