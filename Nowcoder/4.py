# -*- coding:utf-8 -*-
class Solution:
    # array 二维列表
    def Find(self, target, array):
        # write code here
        found = False
        rows = len(array)
        if rows == 0:
            return 
        columns = len(array[0])
        row = 0
        column = columns - 1
        while row < rows and column >= 0:
            if array[row][column] == target:
                found = True
                break
            elif array[row][column] > target:
                column -= 1
            else:
                row += 1
        return found
            