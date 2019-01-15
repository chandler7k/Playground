# -*- coding:utf-8 -*-
class Solution:
    def jumpFloor(self, number):
        # write code here
        arr = [0,1,2]
        if number <= 2: 
            return arr[number]
        fibminust1 = 1
        fibminust2 = 2
        fibN = 0
        for i in range(3,number+1):
            fibN = fibminust1 + fibminust2
            fibminust1 = fibminust2
            fibminust2 = fibN
        return fibN