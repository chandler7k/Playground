//: Playground - noun: a place where people can play

import Foundation

class ListNode{
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
}
