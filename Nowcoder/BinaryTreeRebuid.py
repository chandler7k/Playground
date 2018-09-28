# -*- coding:utf-8 -*-
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
class Solution:
    # 返回构造的TreeNode根节点
    def reConstructBinaryTree(self, pre, tin):
        # write code here
        if not pre or not tin:
        	return None

        root = TreeNode(pre.pop(0))
        ind = tin.index(root.val)
        root.left = self.reConstructBinaryTree(pre,tin[:ind])
        root.right = self.reConstructBinaryTree(pre,tin[ind + 1:])
        return root
