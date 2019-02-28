# -*- coding:utf-8 -*-
class Solution:
    def MoreThanHalfNum_Solution(self, numbers):
        # write code here
        if len(numbers) <=0:
            return
        d = {}
        res = 0
        for i in numbers:
            if i in d:
                d[i] += 1
            else:
                d[i] = 1
        for j in d:
            if d[j] > (len(numbers) * 2):
                res = j
        return res