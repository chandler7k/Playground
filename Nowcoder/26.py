# -*- coding:utf-8 -*-

class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    def HasSubtree(self, pRoot1, pRoot2):
        # write code here
        result = False
        # 正常递归
        if pRoot1 is not None and pRoot2 is not None:
            if self.equal(pRoot1.val, pRoot2.val):
                result = self.isTree1HasTree2(pRoot1, pRoot2)
            if not result:
                result = self.isTree1HasTree2(pRoot1.left, pRoot2)
            if not result:
                result = self.isTree1HasTree2(pRoot1.right, pRoot2)
        return result
    
    def isTree1HasTree2(self, pRoot1, pRoot2):
        #正常递归，注意鲁棒性
        if pRoot2 is None:
            return True
        if pRoot1 is None:
            return False
        
        if not self.equal(pRoot1.val, pRoot2.val):
            return False
        return self.isTree1HasTree2(pRoot1.left, pRoot2.left) and self.isTree1HasTree2(pRoot1.right, pRoot2.right)

    def equal(self, a, b):
        if abs(a-b) < 1e-9:
            return True
        else:
            return False