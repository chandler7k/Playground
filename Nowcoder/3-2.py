# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # 返回从尾部到头部的列表值序列，例如[1,2,3]
    def printListFromTailToHead(self, listNode):
    	ls = []
        if listNode is not None:
            if listNode.next is not None:
                ls += self.printListFromTailToHead(listNode.next)
            ls += [listNode.val]
        return ls




# ls = []
#     	if listNode is not None:
#             if listNode.next is not None:
#         		ls += self.printListFromTailToHead(listNode.next)
#             ls += [listNode.val]
#     	return ls
#         # write code here