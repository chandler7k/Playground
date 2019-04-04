# -*- coding:utf-8 -*-
# class Solution:
#     def Permutation(self, ss):
#         # write code here
#         if len(ss) <= 0:
#             return []
#         res = list()
#         self.perm(ss,res,'')
#         uniq = list(set(res))
#         return sorted(uniq)
    
#     def perm(self, ss, res, path):
#         if ss == '':
#             res.append(path)
#         else:
#             for i in range(len(ss)):
#                 self.perm(ss[:i] + ss[i+1:], res, path + ss[i])
#                 # Python 的切片，都是到：i 的i前面一位，卧槽
#                 #他妈的得把前面用切片的题重新看一下了

# -*- coding:utf-8 -*-
class Solution:
    def Permutation(self, ss):
        if len(ss) == 0:
            return []
        res = list()
        self.perm(ss, res, '')
        uniq = list(set(res))
        return sorted(uniq)

    def perm(self, ss, res, path):
        if ss == '':
            res.append(path)
        else:
            for i in range(len(ss)):
                self.perm(ss[:i] + ss[i+1:], res, path + ss[i])