# -*- coding:utf-8 -*-
class Solution:
    # 分成两个数组，二分查找，中间值比头大则中间为头，比tail小则中间为tail
    def minNumberInRotateArray(self, rotateArray):
        # write code here
        if len(rotateArray) == 0:
            return []
        start, last = 0,len(rotateArray) - 1
        mid = (start + last)/2
        while start <= last:
            if last - start == 1:
                mid = last
                break
            mid = (start + last)/2
            if rotateArray[mid] >= rotateArray[start]:
                start = mid
            elif rotateArray[mid] <= rotateArray[last]:
                last = mid
        return rotateArray[mid]
            
        

        