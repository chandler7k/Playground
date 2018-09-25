# -*- coding:utf-8 -*-
class Solution:
    # array 二维列表
    def Find(self, target, array):
        # write code here
        row = len(array)
        col = len(array[0])
        i = row - 1
        j = 0
        while j < col and i >= 0:
        	if array[i][j] > target:
        		i -= 1
        	elif target > array[i][j]:
        		j += 1
        	else: 
        		return True
        return False