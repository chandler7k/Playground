# # -*- coding:utf-8 -*-
# class Solution:
#     def FindGreatestSumOfSubArray(self, array):
#         # write code here
#         if len(array) == 0:
#             return 0
#         max_sum = -0xffffff
#         cur_sum = 0
#         for i in array:
#             if cur_sum <= 0:
#                 cur_sum = i
#             else:
#                 cur_sum += i
#             if max_sum < cur_sum:
#                 max_sum = cur_sum
#         return max_sum


# -*- coding:utf-8 -*-
class Solution:
    def FindGreatestSumOfSubArray(self, array):
        if len(array) == 0:
            return 0
        sumlist = []
        cursum = 0
        curFinalSum = -0xffffffff # 避免全是负数的情况。
        for i in range(len(array)):
            if cursum < 0:
                cursum = array[i]
            else:
                cursum += array[i]
            if cursum > curFinalSum:
                curFinalSum = cursum
        return curFinalSum
            