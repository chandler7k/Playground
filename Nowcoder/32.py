# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 返回从上到下每个节点值列表，例：[1,2,3]
    def PrintFromTopToBottom(self, root):
        # write code here
        que = []
        res = []
        if not root:
            return res
        que.append(root)
        res.append(root.val)
        while len(que) > 0:
            node = que[0]
            que = que[1:]
            if node.left is not None:
                que.append(node.left)
                res.append(node.left.val)
            if node.right is not None:
                que.append(node.right)
                res.append(node.right.val)
        return res
            