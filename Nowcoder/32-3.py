# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    def Print(self, pRoot):
        # write code here
        res = []
        if not pRoot:
            return res
        que = [[]]
        que[0].append(pRoot)
        que.append([])
        row = []
        current = 0
        nextIndex = 1
        while len(que[current]) > 0:
            node = que[current][0]
            row.append(node.val)
            que[current] = que[current][1:]
            #这里他妈是个栈啊！ 注意是insert + [1:]切片
            if current == 0:
                if node.left is not None:
                    que[nextIndex].insert(0, node.left)
                if node.right is not None:
                    que[nextIndex].insert(0, node.right)
            else:
                if node.right is not None:
                    que[nextIndex].insert(0,node.right)
                if node.left is not None:
                    que[nextIndex].insert(0, node.left)
            if len(que[current]) == 0:
                res.append(row)
                row = []
                current = 1 - current
                nextIndex = 1 - nextIndex
        return res