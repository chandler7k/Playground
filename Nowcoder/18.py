class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
    
class Solution:
    def deleteNode(self, pListHead, pListNode):
        if pListHead is None or pListNode is None:
            return 
        
        # not tail
        if pListNode.next != None:
            pNext = pListNode.next
            pListNode.val = pNext.val
            pListNode.next = pNext.next
            pNext = None
        elif pListHead == pListNode:
            pListNode = None
            pListHead = None
        else:
            pNode = pListHead
            while pNode.next != pListNode:
                pNode = pNode.next
            pNode.next = pListNode.next
            pListNode.next = None