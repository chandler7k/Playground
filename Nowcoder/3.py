# -*- coding:utf-8 -*-
class Solution:
    # 这里要特别注意~找到任意重复的一个值并赋值到duplication[0]
    # 函数返回True/False
    def duplicate(self, numbers, duplication):
        # write code here
        if len(numbers) == 0:
            return False
        length = len(numbers)
        for i in range(length):
            if numbers[i] < 0 or numbers[i] > length - 1:
                return False
        
        for i,val in enumerate(numbers):
            if val != i:
                if val == numbers[val]:
                    duplication[0] = val
                    return True
                numbers[i], numbers[val] = numbers[val], numbers[i]
        
        return False
            