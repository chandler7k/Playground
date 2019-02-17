# -*- coding:utf-8 -*-
class Solution:
    def reOrderArray(self, array):
        # write code here
        oddarr = [x for x in array if x%2 == 1]
        even = [x for x in array if x%2 ==0]
        return oddarr + even



