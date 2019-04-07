# -*- coding:utf-8 -*-
class Solution:
    def PrintMinNumber(self, numbers):
        # write code here
        lmb = lambda x,y: int(str(x) + str(y))-int(str(y)+str(x))
        arr = sorted(numbers, cmp=lmb)
        return ''.join(str(i) for i in arr)