# -*- coding:utf-8 -*-
class Solution:
    def GetLeastNumbers_Solution(self, tinput, k):
        # write code here
        if len(tinput) < k or k <= 0: #他妈的还有这个条件 k不能为0！！！
            return []
        length = len(tinput)
        start = 0
        end = length - 1
        index = self.partition(tinput, length, start, end)
        while index != (k-1):
            if index > k-1:#前index位比K多，从start到K重新排序
                end = index - 1
                index = self.partition(tinput, length, start, end)
            else:#前start已经排序，但是start到k还没排好
                start = index + 1
                index = self.partition(tinput, length, start, end)
        return sorted(tinput[:k])

    def partition(self, data, length, start, end):
        temp = data[start]
        while start < end:
            while start < end and data[end] >= temp:
                end -= 1
            data[start] = data[end]
            while start < end and data[start] <= temp:
                start += 1
            data[end] = data[start] #交换后面那个比temp大的到end
            
        data[start] = temp
        return start
    