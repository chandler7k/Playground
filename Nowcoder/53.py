# -*- coding:utf-8 -*-
class Solution:
    def GetNumberOfK(self, data, k):
        # write code here
        cnt = 0
        if len(data)!= 0:
            first = self.getFistK(data,k,0,len(data)-1)
            last = self.getLastK(data,k,0,len(data)-1)
            if first >= 0 and last <= len(data)-1:
                cnt = last - first + 1
        return cnt
    def getFistK(self, data, k, start, end):
        if start > end:
            return -1
        mid = (start+end)//2
        midData = data[mid]
        if midData == k:
            if (mid > 0 and data[mid-1] != k) or mid == 0:
                return mid
            else:
                end = mid-1
        elif midData > k:
            end = mid - 1
        else:
            start = mid + 1
        return self.getFistK(data,k,start,end)

    def getLastK(self, data, k, start, end):
        if start > end:
            return -1
        mid = (start+end)//2
        midData = data[mid]
        if midData == k:
            if (mid < len(data)-1 and data[mid+1] != k) or mid == len(data)-1:
                return mid
            else:
                start = mid+1
        elif midData > k:
            end = mid - 1
        else:
            start = mid + 1
        return self.getLastK(data,k,start,end)