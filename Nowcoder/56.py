# -*- coding:utf-8 -*-
class Solution:
    # 返回[a,b] 其中ab是出现一次的两个数字
    def FindNumsAppearOnce(self, array):
        # write code here
        resultEx = 0
        for obj in array:
            resultEx ^= obj
        indexof1 = self.findFirstBit1(resultEx)
        num1,num2 = 0,0
        for obj in array:
            if self.isIndex1(obj,indexof1):
                num1 ^= obj
            else:
                num2 ^= obj
        return num1, num2


    def findFirstBit1(self, num):
        indexBit = 0
        while not num & 1:
            num >>= 1
            indexBit += 1
        return indexBit

    def isIndex1(self, num,index):
        num >>= index
        return num & 1
