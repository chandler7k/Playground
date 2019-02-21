# -*- coding:utf-8 -*-
class Solution:
    # matrix类型为二维列表，需要返回列表
    def printMatrix(self, matrix):
        # write code here
        if matrix is None:
            return
        
        rows = len(matrix)
        columns = len(matrix[0])
        
        start = 0
        res = []
        while columns > start * 2 and rows > start * 2:
            endX = columns - 1 - start
            endY = rows - 1 - start
            for i in range(start,endX+1):
                res.append(matrix[start][i])
            
            if start < endY:
                for i in range(start + 1,endY+1):
                    res.append(matrix[i][endX])
            if start < endX and start < endY:
                for i in range(endX - 1, start - 1, -1):
                    res.append(matrix[endY][i])
                
            if start < endY - 1 and start < endX:
                for i in range(endY - 1, start, -1):
                    res.append(matrix[i][start])
            start += 1
        return res
    
    

            
