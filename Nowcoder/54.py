# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 返回对应节点TreeNode
    def __init__(self):
        self.k = 0
    def KthNode(self, pRoot, k):
        # write code here
        if not pRoot:
            return None
        self.k = k
        return self.kthNodeCore(pRoot)
    
    def kthNodeCore(self, pRoot):
        target = None

        if pRoot.left:
            target = self.kthNodeCore(pRoot.left)
        
        if target is None:
            if self.k == 1:
                target = pRoot
            else: 
                self.k-=1
        if target is None and pRoot.right:
            target = self.kthNodeCore(pRoot.right)
        return target