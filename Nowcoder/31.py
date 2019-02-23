# -*- coding:utf-8 -*-
class Solution:
    def IsPopOrder(self, pushV, popV):
        # write code here
        length = len(pushV)
        tempV = []
        isPossible = False
        if length > 0 and len(popV) > 0:
            while len(popV) > 0:
                while len(tempV) == 0 or tempV[0] != popV[0]:
                    if len(pushV) == 0:
                        break
                    tempV.insert(0, pushV[0])
                    pushV = pushV[1:]
                if tempV[0] != popV[0]:
                    break
                tempV.remove(popV[0])
                popV = popV[1:]
            if len(tempV) == 0 and len(popV) == 0:
                isPossible = True
        return isPossible
        