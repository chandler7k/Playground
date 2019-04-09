# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    def __init__(self):
        self.pdepth = 0
        self.left = 0
        self.right = 0
    def IsBalanced_Solution(self, pRoot):
        # write code here
        return self.isBalenced(pRoot,self.pdepth)

    def isBalenced(self, pRoot,pdepth):
        if pRoot is None:
            self.pdepth = 0
            return True
        if(self.isBalenced(pRoot,self.left) and self.isBalenced(pRoot,self.right)):
            diff = self.left - self.right
            if abs(diff)<=1:
                self.pdepth = 1+max(self.left,self.right)
                return True
        return False
        