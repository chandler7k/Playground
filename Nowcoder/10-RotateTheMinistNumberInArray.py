# -*- coding:utf-8 -*-
class Solution:
    def minNumberInRotateArray(self, rotateArray):
        # write code here
        if len(rotateArray) == 0:
            return
        
        start = 0
        end = len(rotateArray) - 1
        mid = (start + end) / 2
        while rotateArray[start] >= rotateArray[end]:
            if end - start == 1:
                mid = end
                break;
            
            mid = (start + end) / 2
            #首先处理一下特殊情况：给出数组为[1,0,1,1,1]
            #这种情况start, end, mid都是相同的，可能判断不出来
            #不得不采用顺序查找
            if rotateArray[start] == rotateArray[end] and rotateArray[start] == rotateArray[mid] and rotateArray[mid] == rotateArray[end]:
                result = rotateArray[start]
                for i in range(start + 1, end):
                    if result > rotateArray[i]:
                        result = rotateArray[i]
                return result
            if rotateArray[mid] >= rotateArray[start]:
                start = mid
            elif rotateArray[mid] <= rotateArray[end]:
                end = mid
        
        return rotateArray[mid]

        