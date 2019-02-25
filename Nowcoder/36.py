# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    def Convert(self, pRootOfTree):
        # write code here
        pLastNode = None
        pLastNode = self.convertNode(pRootOfTree, pLastNode)
        pTail = pLastNode
        while pTail is not None and pTail.left is not None:
            pTail = pTail.left
        return pTail

    def convertNode(self, pNode, pLastNode):
        if pNode is None:
            return 
        pCur = pNode
        if pCur.left is not None:
            pLastNode = self.convertNode(pCur.left, pLastNode)
        pCur.left = pLastNode
        if pLastNode:
            pLastNode.right = pCur
        pLastNode = pCur
        if pCur.right is not None:
            pLastNode = self.convertNode(pCur.right, pLastNode)
        return pLastNode