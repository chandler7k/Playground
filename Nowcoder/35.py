# -*- coding:utf-8 -*-
class RandomListNode:
    def __init__(self, x):
        self.label = x
        self.next = None
        self.random = None
class Solution:
    # 返回 RandomListNode
    def Clone(self, pHead):
        # write code here
        self.cloneNodes(pHead)
        self.connectSlibNodes(pHead)
        return self.deconnectNodes(pHead)

    def cloneNodes(self, pHead):
        pNode = pHead
        while pNode is not None:
            pClone = RandomListNode(0)
            pClone.label = pNode.label
            pClone.next = pNode.next
            pClone.random = None
            pNode.next = pClone
            pNode = pClone.next
    
    def connectSlibNodes(self, pHead):
        pNode = pHead
        while pNode is not None:
            pClone = pNode.next
            if pNode.random is not None:
                pClone.random = pNode.random.next
            pNode = pClone.next
    
    def deconnectNodes(self, pHead):
        pNode = pHead
        pCloneHead = None
        pCloneNode = None
        if pNode is not None:
            pCloneNode = pNode.next
            pCloneHead = pCloneNode
            pNode.next = pCloneNode.next
            pNode = pCloneNode.next
        while pNode is not None:
            pCloneNode.next = pNode.next
            pCloneNode = pCloneNode.next
            pNode.next = pCloneNode.next
            pNode = pNode.next
        return pCloneHead
        

