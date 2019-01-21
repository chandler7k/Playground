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
            if rotateArray[mid] >= rotateArray[start]:
                start = mid
            elif rotateArray[mid] <= rotateArray[end]:
                end = mid
        
        return rotateArray[mid]

        