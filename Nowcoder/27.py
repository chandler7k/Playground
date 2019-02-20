# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 返回镜像树的根节点
    def Mirror(self, root):
        # write code here
        if root is None:
            return root
        if root.left is None and root.right is None:
            return root
        
        root.left,root.right = root.right, root.left
        # 这里的题意好像是不要求返回 在本层自动获取root
        if root.left is not None:
            self.Mirror(root.left)
        if root.right is not None:
            self.Mirror(root.right)
        return root