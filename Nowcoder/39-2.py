# -*- coding:utf-8 -*-
class Solution:
    def MoreThanHalfNum_Solution(self, numbers):
        # write code here
        if len(numbers) <=0:
            return
        res = numbers[0]
        num = 0
        for i in numbers:
            if num == 0:
                num += 1
                res = i
            elif num != 0 and res != i:
                num -= 1
            elif num != 0 and res == i:
                num += 1
        count = 0
        for i in numbers:
            if i == res:
                count += 1
        if count > len(numbers) / 2:
            return res
        else:
            return 0