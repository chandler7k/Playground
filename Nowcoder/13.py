# -*- coding:utf-8 -*-
class Solution:
    def __init__(self):
        self.visisted = {}
    def movingCount(self, threshold, rows, cols):
        return self.movingCountCore(threshold, rows, cols, 0, 0)

    # 判断周围点是否符合 符合就递归，注意这里在递归前已经写好了判定条件，所以不用担心越界。
    def movingCountCore(self, threshold, rows, cols, row, col):
        if row > rows or col > cols or row < 0 or col < 0:
            return 0
        if (row,col) in self.visisted:
            return 0
        if self.getDigitSum(row) + self.getDigitSum(col) > threshold:
            return 0
        
        return 1 + self.movingCountCore(threshold,rows,cols,row + 1, col) + self.movingCountCore(threshold,rows,cols,row -1, col) + self.movingCountCore(threshold,rows,cols,row, col + 1) + self.movingCountCore(threshold,rows,cols,row, col-1)
        
    # 获取数位之和
    def getDigitSum(self, num):
        digitSum = 0
        while(num > 0):
            digitSum += num % 10;
            num /= 10
        return digitSum