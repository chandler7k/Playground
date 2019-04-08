class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
class Solution:
    def FindFirstCommonNode(self, pHead1, pHead2):
        length1 = self.getLength(pHead1)
        length2 = self.getLength(pHead2)

        if length1 <= length2:
            longHead,shortHead = pHead2,pHead1
        else:
            longHead,shortHead = pHead1,pHead2
        
        for _ in range(abs(length1-length2)):
            longHead = longHead.next
        
        while longHead and shortHead and longHead!=shortHead:
            longHead = longHead.next
            shortHead = shortHead.next
        return longHead
        

    def getLength(self, phead):
        cnt = 0
        while phead:
            cnt += 1
            phead = phead.next
        return cnt