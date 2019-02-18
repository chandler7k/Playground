# -*- coding:utf-8 -*-
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None
class Solution:
    # 返回ListNode
    def ReverseList(self, pHead):
        # write code here
        # phead is none
        if pHead is None or pHead.next is None:
            return pHead
        pReverseHead = None
        pNode = pHead
        pPrev = None
        while pNode is not None:
            pNext = pNode.next
            if pNext is None:
                pReverseHead = pNode
            
            pNode.next = pPrev
            pPrev = pNode
            pNode = pNext
        return pReverseHead