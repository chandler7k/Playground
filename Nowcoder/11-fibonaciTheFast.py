# -*- coding:utf-8 -*-
class Solution:
    def Fibonacci(self, n):
        # write code here
        fibarr = [0,1]
        if n < 2:
            return fibarr[n]
        

        fibMinust1 = 0
        fibMinust2 = 1
        fibN = 0
        for i in range(n):
            fibN = fibMinust1 + fibMinust2
            fibMinust2 = fibMinust1
            fibMinust1 = fibN

        return fibN