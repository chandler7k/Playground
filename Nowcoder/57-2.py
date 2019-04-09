# -*- coding:utf-8 -*-
class Solution:
    def FindContinuousSequence(self, tsum):
        # write code here
        res = []
        small = 1
        big = 2
        mid = (1+tsum)//2
        cursum = small + big
        while small < mid:
            if cursum == tsum:
                res.append(range(small,big+1))
            while cursum > tsum and small < mid:
                cursum -= small
                small += 1
                if cursum == tsum:
                    res.append(range(small,big+1))
            big +=1
            cursum += big
        return res