# # -*- coding:utf-8 -*-
# class Solution:
#     # s 源字符串
#     def replaceSpace(self, s):
#         # write code here
#         if len(s) == 0:
#             return 
#         originLength = len(s)
#         numberOfBlank = 0
#         for i in s:
#             if i == '\0':
#                 numberOfBlank += 1
#         newLength = originLength + numberOfBlank * 2
#         indexOfOrigin = originLength
#         indexOfNew = newLength
#         while indexOfOrigin >= 0 and indexOfNew > indexOfOrigin:
#             if s[indexOfOrigin] == '\0':
#                 s[indexOfNew] = '0'
#                 indexOfNew -= 1
#                 s[indexOfNew] = '2'
#                 indexOfNew -= 1
#                 s[indexOfNew] = '%'
#                 indexOfNew -= 1
#             else:
#                 s[indexOfNew] = s[indexOfOrigin]
#                 indexOfNew -= 1
#             indexOfOrigin -= 1
        
# -*- coding:utf-8 -*-
class Solution:
    # s 源字符串
    def replaceSpace(self, s):
        # write code here
        if len(s) == 0:
            return 
        originLength = len(s)
        numberOfBlank = 0
        for i in s:
            if i == '\0':
                numberOfBlank += 1
        newLength = originLength + numberOfBlank * 2
        s += ' ' * numberOfBlank * 2
        indexOfOrigin = originLength
        indexOfNew = newLength
        while indexOfOrigin >= 0 and indexOfNew > indexOfOrigin:
            if s[indexOfOrigin] == '\0':
                s[indexOfNew] = '0'
                indexOfNew -= 1
                s[indexOfNew] = '2'
                indexOfNew -= 1
                s[indexOfNew] = '%'
                indexOfNew -= 1
            else:
                s[indexOfNew] = s[indexOfOrigin]
                indexOfNew -= 1
            indexOfOrigin -= 1
        return s