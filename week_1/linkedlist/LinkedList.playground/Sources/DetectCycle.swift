import Foundation

/**
 * 142. https://leetcode-cn.com/problems/linked-list-cycle-ii/
 * 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
 * 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 * 说明：不允许修改给定的链表。
 *
 * 时间复杂度 O(n)
 * 空间复杂度 O(n)
 */

func detectCycle(_ head: ListNode?) -> ListNode? {
    var list = [ListNode]()
    var cur = head
    while cur != nil {
        let isContain = list.contains { (node: ListNode) -> Bool in
            return node === cur
        }
        if isContain {
            return cur
        } else {
            list.append(cur!)
            cur = cur?.next
        }
    }
    
    return nil
}

/**
 * 快慢指针, slow 指针每次走一步 ， fast 指针每次走两步
 * 若没有环，fast 指针走到末端，直接返回
 * 若有环：设 表头到环有结点 a 个 (不含环)，环有结点 b 个
 *      1. 第一次相遇，有关系:
 *          f = 2s
 *          f = s + nb
 *        所以：f = 2nb; s = nb
 *        如果让指针一直按每次一步走，走到环的入口时，步数 k = a + nb
 *        此时 slow 的步数是 nb，只要将 slow 在走 a 不就到达环的入口
 *        我们不知道 a 的值：假设有一个指针与 slow 同时走 a 步，两者在入口点结合
 *      2. 第一次相遇后，fast 指向 head，每次走一步
 *      3. 第二次相遇，fast, slow  同时走 a 步，f = a；s = a + nb，同时指向环的入口
 *
 */
func detectCycle2(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    while true {
        if fast?.next == nil {
            return nil
        }
        fast = fast?.next?.next
        slow = slow?.next
        if fast === slow {
            break
        }
    }
    fast = head
    while fast !== slow {
        fast = fast?.next
        slow = slow?.next
    }
    return fast
}
