# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def FindKthToTail(self, head, k):
        if head is None or k == 0:
            return 
        pfirst = head
        psecond = head
        flag = 1
        while pfirst.next is not None and flag < k:
            pfirst = pfirst.next
            flag += 1
        if flag != k:
            return 
        
        while pfirst.next is not None:
            pfirst = pfirst.next
            psecond = psecond.next
        
        return psecond