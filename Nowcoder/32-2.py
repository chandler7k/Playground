# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 返回二维列表[[1,2],[4,5]]
    def Print(self, pRoot):
        # write code here
        res = []
        if not pRoot:
            return res

        que = [pRoot]
        row = []
        toBePush = 1
        nextLevel = 0
        while len(que) > 0:
            node = que[0]
            row.append(node.val)
            if node.left is not None:
                que.append(node.left)
                nextLevel += 1
            if node.right is not None:
                que.append(node.right)
                nextLevel += 1
            
            que = que[1:]
            toBePush -= 1
            # 换行操作
            if toBePush == 0:
                res.append(row)
                row = []
                toBePush = nextLevel
                nextLevel = 0
        return res