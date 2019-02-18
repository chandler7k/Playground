# -*- coding:utf-8 -*-
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None
class Solution:
    def meetingNode(self, pHead):
        # 因为如果闭环，使用快慢指针之后相遇的点一定在环内
        # 这一步求的就是在环内相遇的点
        if pHead is None:
            return None
        
        pSlow = pHead.next
        if pSlow is None:
            return None
        pQuick = pSlow.next
        
        while pQuick is not None and pSlow is not None:
            if pQuick == pSlow:
                return pQuick
            pQuick = pQuick.next
            pSlow = pSlow.next
            if pQuick is not None:
                pQuick = pQuick.next
        return None
    def EntryNodeOfLoop(self, pHead):
        # write code here
        mtNode = self.meetingNode(pHead)
        if mtNode is None:
            return
        runloop = 1
        pNode = mtNode.next
        # 求环内元素的数量
        while pNode is not None and pNode != mtNode:
            runloop += 1
            pNode = pNode.next
        # 快的先移动runloop个 慢的再开始移动，这样相遇的时候一定是在入口点
        pNode1 = pHead
        for i in range(runloop):
            pNode1 = pNode1.next
        
        pnode2 = pHead
        while pnode2 != pNode1:
            pnode2 = pnode2.next
            pNode1 = pNode1.next
        return pNode1

    