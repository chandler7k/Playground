# -*- coding:utf-8 -*-
# class TreeLinkNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
#         self.next = None
class Solution:
    def GetNext(self, pNode):
        # write code here
        if not pNode:
            return pNode
        if pNode.right:
            right = pNode.right
            while right.left:
                right = right.left
            return right
        p = pNode
        while pNode.next:
            parent = pNode.next
            if parent.left == pNode:
                return parent
            pNode = parent