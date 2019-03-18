# -*- coding:utf-8 -*-
class Solution:
    def NumberOf1Between1AndN_Solution(self, n):
        # write code here
        number = 0
        for i in range(n+1):
            number += self.NumberOf1(i)
        return number

    def NumberOf1(self, n):
        number = 0
        while n:
            if n%10 == 1:
                number += 1
            n = n/10
        return number