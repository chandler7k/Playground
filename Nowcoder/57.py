# -*- coding:utf-8 -*-
class Solution:
    def FindNumbersWithSum(self, array, tsum):
        # write code here
        if len(array)==0:
            return []
        i = 0
        j = len(array)-1
        while i < j:
            cursum = array[i] + array[j]
            if cursum == tsum:
                return [array[i],array[j]]
            elif cursum > tsum:
                j -= 1
            else:
                i += 1
        return []