//: Playground - noun: a place where people can play

import Foundation

class ListNode: Equatable{
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    var val: Int
    var next: ListNode?
    
    init(_ val: Int){
        self.val = val
        self.next = nil
    }
}

class List{
    var head: ListNode?
    var tail: ListNode?
    
    //append Node to tail
    func appendToTail(_ val: Int){
        if tail == nil{
            tail = ListNode(val)
            head = tail
        }else{
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    
    // append Node to head
    func appendToHead(_ val: Int){
        if head == nil{
            head = ListNode(val)
            tail = head
        }else{
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
    
    func getLeftList(_ head: ListNode?, _ x: Int) -> ListNode?{
        let dummy = ListNode(0)
        var pre = dummy,node = head
        while node != nil{
            if node!.val < x{
                pre.next  = node
                pre = node!
            }
            node = node?.next
        }
        pre.next = nil
        
        return dummy.next
    }
    
    func hasCircle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while fast != nil && fast!.next != nil{
            slow = slow!.next
            fast = fast!.next!.next
            
        }
        if slow == fast{
            return true
        }
        return false
    }
    
    func removeNthFromEnd(head: ListNode? ,_ n: Int) -> ListNode?{
        guard let head = head else{
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        var prev: ListNode? = head
        var post: ListNode? = head
        
        for _ in 0..<n{
            if post == nil{
                break
                
            }
            post = post!.next
        }
        
        
        while post != nil && post!.next != nil{
            prev = prev!.next
            post = post!.next
        }
        
        prev!.next = prev!.next!.next
        return dummy.next
    }
    
}
