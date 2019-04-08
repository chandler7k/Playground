# -*- coding:utf-8 -*-
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None
class Solution:
    def FindFirstCommonNode(self, pHead1, pHead2):
        # write code here
        stck1 = []
        stck2 = []
        h1,h2 = pHead1,pHead2
        while h1:
            stck1.append(h1)
            h1 = h1.next
        while h2:
            stck2.append(h2)
            h2 = h2.next
        cur = None
        while stck1 and stck2:
            if stck1.pop() == stck2[-1]:
                cur = stck2.pop()
            else:
                return cur
        return cur