# -*- coding:utf-8 -*-
class Solution:
    def InversePairs(self, data):
        # write code here
        # 不能逐个比较，应当比较相邻的然后做处理。
        copy = data
        length = len(data)
        count = self.InversePairsCore(data,copy,0,length - 1)
        return count % 1000000007
    def InversePairsCore(self,data,copy,start,end):
        if start == end:
            copy[start] = data[start]
            return 0
        if end - start == 0:
            if data[start] <= data[end]:
                return 0
            else:
                copy[start],copy[end] = data[end], data[start]
                return 1
        mid = (start + end)//2
        left = self.InversePairsCore(copy, data,start, mid)
        right = self.InversePairsCore(copy,data,mid+1,end)

        i = start+mid
        j = end
        count = left+right
        indexCopy = end
        while i>=start and j>=start+mid+1:
            if data[i]>data[j]:
                copy[indexCopy] = data[i]
                indexCopy-=1;i-=1
                count += j-mid
            else:
                copy[indexCopy] = data[j]
                indexCopy-=1
                j-=1
        
        # not nil
        while i >= start:
            copy[indexCopy] = data[i]
            indexCopy -= 1
            i -=1
        while j >= start + mid + 1:
            copy[indexCopy] = data[j]
            indexCopy -= 1
            j -= 1
        return count
