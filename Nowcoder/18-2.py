# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
class Solution:
    def deleteDuplication(self, pHead):
        # write code here
        if pHead is None or pHead.next is None:
            return pHead
        # pre用来保存前一个点
        pCurNode = pHead
        pPreNode = None
        while pCurNode:
            pNext = pCurNode.next
            needToDelete = False
            if not pNext:
                return pHead
            elif pNext is not None and pNext.val == pCurNode.val:
                needToDelete = True
            
            if not needToDelete:
                pPreNode = pCurNode
                pCurNode = pCurNode.next
            else:
                value = pCurNode.val
                pToDelete = pCurNode
                while pToDelete is not None and pToDelete.val == value:
                    pNext = pToDelete.next
                    pToDelete = pNext
            # pre 一定要接上
            # pre 为空，那也就是说从head开始到Next间的部分都重复都被删掉了，head接上    
            if pPreNode is None:
                pHead = pNext
            else:
                pPreNode.next = pNext
            pCurNode = pNext
        return pHead