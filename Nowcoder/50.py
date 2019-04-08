# # -*- coding:utf-8 -*-
# class Solution:
#     def FirstNotRepeatingChar(self, s):
#         # write code here
#         if len(s) == 0:
#             return -1
#         dic = {}
#         res = 0
#         for i, val in enumerate(s):
#             if val in dic:
#                 dic[val] += 1
#             else:
#                 dic[val] = 1
#         for i in range(len(s)):
#             if s[i] in dic and dic[s[i]] == 1:
#                 res = i
#                 break
#         return res
# -*- coding:utf-8 -*-
class Solution:
    def FirstNotRepeatingChar(self, s):
        # write code here
        if len(s) == 0:
            return -1
        dic = {}
        res = 0
        for i, val in enumerate(s):
            if val in dic:
                dic[val] += 1
            else:
                dic[val] = 1
        for i,val in enumerate(s):
            if val in dic and dic[val] == 1:
                res = i
                break
        return res